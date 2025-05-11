
# 🎬 Flutter Clean Architecture (with Pagination Support)

Bu projede **Clean Architecture** yaklaşımı temel alınarak yapılandırılmış, sayfalama destekli bir film listeleme yapısı yer almaktadır. Mimarinin amacı bağımlılıkları en aza indirerek sürdürülebilir, test edilebilir ve genişletilebilir bir yapı oluşturmaktır.

---

## 🧱 Katmanlar (Layers)

```
lib/
├── core/          # Uygulama geneli yapı taşları (ağ, hata, base sınıflar)
├── shared/        # Tema, ortak widget’lar, extensions vb.
├── features/      # Özelleşmiş işlev modülleri (örnek: onboarding, home)
├── app.dart       # Root widget ve yönlendirme tanımı
└── main.dart      # Entry point (bootstrap başlatılır)
```

---

## 🧩 Clean Architecture Katmanları

### 1. **Presentation (Sunum)**
- Kullanıcı arayüzünü ve durum yönetimini içerir.
- `View`, `ViewModel` veya `Store` yapıları burada yer alır.
- Dış dünyadan gelen input burada alınır ve domain katmanına iletilir.

### 2. **Domain**
- Saf iş mantığının yer aldığı katmandır.
- `Entity`, `Repository Abstraction`, `UseCase` sınıfları bu katmandadır.
- Framework bağımsızdır, dış bağımlılığı yoktur.
- `Repository` arayüzü tanımlanır fakat implementasyonu bilinmez.

### 3. **Data**
- Gerçek verilerin geldiği (API, DB) katmandır.
- `RemoteDataSource`, `Model`, `RepositoryImpl` burada yer alır.
- Bu katman, domain katmanındaki repository arayüzlerini uygular.

---

## 🔗 Veri Akışı

```
 UI (View)
   ↓
Store / ViewModel (Sunum Katmanı)
   ↓
UseCase → Repository (Domain)
   ↓
RepositoryImpl → RemoteDataSource (Data)
   ↓
DioClient → API
```

---

## 📦 Örnek: Film Listeleme (Pagination)

### ✅ Entity: `MovieEntity`

```dart
class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
}
```

### ✅ Entity: `MoviePaginationEntity`

Sayfalama bilgisini (`totalPages`) de içeren bir entity:

```dart
class MoviePaginationEntity {
  final List<MovieEntity> movies;
  final int totalPages;
}
```

---

## 🌐 RemoteDataSource

API çağrılarını yapan sınıf. `dioClient` üzerinden TMDB API ile konuşur.

```dart
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  Future<MovieResponseModel> getMovies({required int page}) {
    return dioClient.get(...);
  }
}
```

---

## 📚 Repository

`RemoteDataSource`'dan gelen veriyi alır, domain katmanına uygun hale getirir.

```dart
class MovieRepositoryImpl implements MovieRepository {
  Future<MoviePaginationEntity> getMovies({required int page}) {
    final response = await remoteDataSource.getMovies(page: page);
    return MoviePaginationEntity(...);
  }
}
```

---

## 🧠 Store (MobX örneği)

Durum yönetimi burada yapılır. UI buradaki observable'lara bağlıdır.

```dart
@observable
ObservableList<MovieEntity> movies = ObservableList();

@action
Future<void> fetchMovies() {
  final result = await movieRepository.getMovies(page: currentPage);
  movies.addAll(result.movies);
}
```

---

## 📌 Neden Bu Yapı?

✅ Test edilebilir yapı  
✅ Katmanlar arası sorumluluk ayrımı  
✅ Esnek değiştirilebilirlik (örn. API yerine local DB kullanmak kolay)  
✅ Daha sürdürülebilir ve anlaşılır projeler

---

## 📂 Dosya Konumları

| Sınıf                     | Yol                                                                 |
|--------------------------|----------------------------------------------------------------------|
| `MovieRemoteDataSource`  | `lib/features/onboarding/data/datasources/movie_remote_data_source.dart` |
| `MovieRepositoryImpl`    | `lib/features/onboarding/data/repositories/movie_repository_impl.dart` |
| `MovieRepository`        | `lib/features/onboarding/domain/repositories/movie_repository.dart` |
| `MovieEntity`            | `lib/features/onboarding/domain/entities/movie_entity.dart`         |
| `MoviePaginationEntity`  | `lib/features/onboarding/domain/entities/movie_pagination_entity.dart` |
| `MovieStore`             | `lib/features/onboarding/presentation/stores/movie_store.dart`      |

---

## 🛠️ Gereksinimler

- Dio
- MobX (veya alternatif bir state management)
- Freezed / JsonSerializable (Model ve Entity eşlemesi için)

---

## 📬 Katkı

Yeni katman eklemek veya bir özelliği genişletmek için ilgili klasördeki dosya yapısını izleyerek ilerleyebilirsin. Domain katmanına dokunmadan, UI ve veri katmanlarını değiştirmek bu yapıyla kolaydır.

---
