# 4k
1. Сделать приложение с 1м экраном используя swift 5+
2. Дизайн - https://www.figma.com/file/J3y4OhL1wMI3VTTrcNG5nT/Test-project?node-id=325%3A786
3. В приложении запрещено использовать storyboards/xib не считая launchScreen. 
4. Для UI использовать SnapKit.
5. Архитектура - MVC

Описание: 
Экран представляет собой список дверей которые можно открыть кликнув на ячейку. 
При старте приложения сымитировать подгрузку по API списка дверей в течении 2-3 секунд, затем использовать хардкодную модель. 
При клике на ячейку сымитировать вызов API, дверь должна принять "Unlocking..." статус на 3 секунды, затем "Unlocked" статус на 3 секунды, затем исходный "Locked" статус. 
Отдельно привязать клик на "Locked" label, по клику дверь должна так же открываться как описано выше.
