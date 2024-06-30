// Слушаем событие загрузки страницы от Turbo (используется в Rails для улучшения навигации)
document.addEventListener("turbo:load", function () {
    // Находим все кнопки "Show rooms" / "Hide rooms"
    const showHideButtons = document.querySelectorAll(".show-hide-rooms");

    // Для каждой найденной кнопки выполняем следующие действия
    showHideButtons.forEach(button => {
        // Находим связанный с кнопкой элемент collapse (коллапс)
        const collapse = document.querySelector(button.dataset.bsTarget);

        // Устанавливаем обработчик клика на кнопку
        button.addEventListener("click", function () {
            // Здесь не нужно вручную менять текст кнопки, так как это делается через события 'show' и 'hide'
        });

        // Устанавливаем начальное состояние текста кнопки в зависимости от состояния коллапса
        if (collapse.classList.contains("show")) {
            button.textContent = "Hide rooms"; // Если коллапс открыт, текст кнопки - "Hide rooms"
        } else {
            button.textContent = "Show rooms"; // Если коллапс закрыт, текст кнопки - "Show rooms"
        }

        // Добавляем обработчик события открытия коллапса
        collapse.addEventListener('show.bs.collapse', function () {
            button.textContent = "Hide rooms"; // Меняем текст кнопки на "Hide rooms", когда коллапс открывается
            const viewMoreButton = collapse.querySelector(".view-more");
            if (viewMoreButton) {
                viewMoreButton.classList.remove("d-none"); // Показываем кнопку "View more", когда коллапс открыт
            }
        });

        // Добавляем обработчик события закрытия коллапса
        collapse.addEventListener('hide.bs.collapse', function () {
            button.textContent = "Show rooms"; // Меняем текст кнопки на "Show rooms", когда коллапс закрывается
            const viewMoreButton = collapse.querySelector(".view-more");
            if (viewMoreButton) {
                viewMoreButton.classList.add("d-none"); // Скрываем кнопку "View more", когда коллапс закрыт
            }
        });
    });
});
