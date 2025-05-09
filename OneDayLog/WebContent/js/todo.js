function toggleTaskAjax(checkbox, todoId) {
    const completed = checkbox.checked;

    fetch('updateTodoCompleted.action', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `todoId=${todoId}&completed=${completed}`
    })
    .then(res => res.text())
    .then(data => {
        if (data === "success") {
            const text = checkbox.closest('li').querySelector('.task-text');
            text.classList.toggle('task-completed', completed);
        } else {
            alert("업데이트 실패");
        }
    });
}
