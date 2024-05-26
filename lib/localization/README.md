# Локализация 

для локализации используется intl + flutter_localizations

## Использовании 
для запуска генерации использовать команду 
- flutter pub global run intl_utils:generate
для добавления новых слов нужно добавит ключ и значения в файлы .arb внутри папки translations
### Структура 
- **translations**
    - **generated** - сгенерированные файлы
    - **translations** - arb файлы с переводом
    - **localization.dart** - класс отвечает за локализацию проекта 