# Feature
в папке хранятся все фичи, название папки должно отображать, то за что отвечает фича

### Структура папок feature

- **/data** - слой данных
    - **/dto** - Data Transform Object
    - **/repositories** - реализации репозиториев
    - **/services** - реализации сервисов
- **/domain** - слой бизнес логики
    - **/entities** - модели которые используются для работы в domain/presentation слоях
    - **/repositories** - интерфейсы репозиториев, которые используются в domain слое
    - **/services** - интерфейсы сервисов, которые используются в domain слое
    - **/state** - файлы state managment библиотек (redux,bloc итд)
- **/presentation** - слой представления
    - **/screens** - страницы
    - **/modals** - Модальные окна
    - **/components** - компоненты фичи 
    - **/routes** - все роуты фичи 