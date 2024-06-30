document.addEventListener("DOMContentLoaded", function () {
    // Находим все кнопки "Delete" для изображений и добавляем обработчик события клика
    document.querySelectorAll(".btn-danger").forEach(button => {
        button.addEventListener("click", function () {
            // Запрашиваем подтверждение удаления изображения
            if (confirm("Are you sure you want to delete this image?")) {
                const imageId = this.dataset.imageId; // Получаем идентификатор изображения
                const resortId = "<%= @resort.id %>"; // Получаем идентификатор курорта

                // Отправляем запрос DELETE для удаления изображения
                fetch(`/resorts/${resortId}/delete_image?image_id=${imageId}`, {
                    method: "DELETE",
                    headers: {
                        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content // Добавляем CSRF-токен для защиты от межсайтовых запросов
                    }
                }).then(response => {
                    if (response.ok) {
                        this.closest(".col-md-2").remove(); // Удаляем блок с изображением из DOM в случае успеха
                    } else {
                        alert("Failed to delete the image."); // Выводим сообщение об ошибке в случае неудачи
                    }
                });
            }
        });
    });
});