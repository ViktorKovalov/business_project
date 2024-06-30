// Ждем, пока весь HTML-документ будет загружен и готов к обработке
document.addEventListener("DOMContentLoaded", function () {

    // Получаем элементы input для даты заезда и выезда, а также кнопку отправки формы
    const checkInDateInput = document.getElementById("check-in-date");
    const checkOutDateInput = document.getElementById("check-out-date");
    const submitButton = document.getElementById("submit-button");

    // Получаем сегодняшнюю дату и на следующий день для установки минимальных значений
    const today = new Date().toISOString().split('T')[0]; // Сегодняшняя дата в формате YYYY-MM-DD
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1); // Увеличиваем дату на 1 день
    const tomorrowString = tomorrow.toISOString().split('T')[0]; // Дата следующего дня в формате YYYY-MM-DD

    // Устанавливаем минимальные значения для полей ввода даты заезда и выезда
    checkInDateInput.min = today; // Нельзя выбрать дату раньше сегодняшнего дня
    checkOutDateInput.min = tomorrowString; // Нельзя выбрать дату раньше завтрашнего дня

    // Добавляем слушатель события изменения для поля ввода даты заезда
    checkInDateInput.addEventListener("change", function () {
        // Получаем выбранную дату заезда и выставляем минимальную дату для даты выезда
        const checkInDate = new Date(checkInDateInput.value);
        const nextDay = new Date(checkInDate);
        nextDay.setDate(nextDay.getDate() + 1); // Увеличиваем дату на 1 день
        checkOutDateInput.min = nextDay.toISOString().split('T')[0]; // Устанавливаем минимальную дату для выезда
        validateDates(); // Вызываем функцию проверки дат
    });

    // Добавляем слушатель события изменения для поля ввода даты выезда
    checkOutDateInput.addEventListener("change", validateDates);

    // Функция для проверки выбранных дат и активации/деактивации кнопки отправки формы
    function validateDates() {
        const checkInDate = new Date(checkInDateInput.value); // Получаем дату заезда
        const checkOutDate = new Date(checkOutDateInput.value); // Получаем дату выезда

        // Если выбраны обе даты и дата заезда меньше даты выезда, то
        if (checkInDate && checkOutDate && checkInDate < checkOutDate) {
            submitButton.disabled = false; // Кнопка отправки формы активируется
        } else {
            submitButton.disabled = true; // Иначе кнопка отправки формы деактивируется
        }
    }

    validateDates(); // Вызываем функцию проверки дат для инициализации состояния кнопки
});

