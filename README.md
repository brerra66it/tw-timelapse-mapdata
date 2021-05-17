Кароче, чего я сделал и как

**1. Скачать картинки для обработки**

Написал макрос для кликера (см. uopilot-script.txt) и скачал все картинки через браузер с сайта http://ru68.twmaps.org/archive/all Это минут 20 заняло, из недостатков - цвета скачут, не очень удобно, надо бы разобраться может можно что-то придумать похитрее. В результате у меня получилось 450 картинок, где занято 4 континента из 100, что как бы не очень хорощо смотрится. Альтернативным способом может быть создание собственной карты на основе данных сервера по каждому дню, но это надо заморачиваться

**2. Обрезать картинки под размер видео и приблизить**

Задачу решал в гимпе при помощи скриптов fu-scripts, вдохновлялся кодом из Интернета
* https://stackoverflow.com/questions/5811378/how-do-i-write-a-custom-auto-crop-script-using-the-gimp
* https://github.com/per1234/batch-smart-resize

Мне не нужна была "обрезка от краев", скрипт переделал под себя и добавил увеличение. При отладке скрипта надо не забывать нажимать "refresh fu-scripts", а то можно долго тупить и не видеть результата, вот параметры для запуска скриптов:
* (script-fu-tw-map "c:\\Users\\leb61ww\\Downloads\\таймлапс\\test\\1600901581.png" 
"c:\\Users\\leb61ww\\Downloads\\таймлапс\\test\\1600901581_crop.png" 432 243 372 380)
* (script-fu-tw-map-batch "c:\\Users\\leb61ww\\Downloads\\таймлапс\\test\\*.png"
"_crop" 432 243 372 380)

Ради этих скриптов и завел репозиторий, вдруг еще кому пригодится. Исходный код скриптов тоже приложил. В результате получил все 450 картинок обрезанные и увеличенные до 720p

**3. Сделать видео из картинок**

Дальше все засунул в ProShow Producde и отрендерил, тут кто во что горазд. Результат можно увидеть на ютубе
* https://www.youtube.com/watch?v=Y3AMHDHWC0M

Во втором подходе я добавил картинок с прошедшими днями до закрытия мира ru68, также доработал скрипт чтобы тот вставлял время скриншота из верхнего левого угла исходного изображения. Скрипты пришлось переработать и отладить, читать документацию очень помогло.
* https://www.youtube.com/watch?v=qc-G1GvRZ0Y

**4. Further improvement**
* Define consistent colors for the tribes throughout the whole video, because images from http://ru68.twmaps.org/archive/all are automatically colored depending on some criteria thus switching if tribe leadership is modified.
* Right part of the video is unoccupied, perhaps one may show there some statistics for tribe comparison (e.g. villages, ODA and ODD). This requires advanced scripting, raw data can be parced from twstats and the rendered via gimp or elsehow...
