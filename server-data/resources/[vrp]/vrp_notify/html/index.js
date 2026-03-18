let notifyQueue = [];
let isShowing = false;
let lastMessage = "";

window.addEventListener("message", function(event){
    let data = event.data;

    if (!data.mensagem) return;

    // anti spam
    if (data.mensagem === lastMessage) return;
    lastMessage = data.mensagem;

    notifyQueue.push(data);
    processQueue();
});

function processQueue() {
    if (isShowing || notifyQueue.length === 0) return;

    isShowing = true;
    let data = notifyQueue.shift();

    showNotify(data);
}

function showNotify(data) {

    // 🔊 SOM
    let sound = new Audio("https://actions.google.com/sounds/v1/cartoon/wood_plank_flicks.ogg");
    sound.volume = 0.2;
    sound.play();

    let html = `
    <div class='notify animate__animated'>
        <div class='notification ${data.css}'>
            <div class='icon'></div>
            <div class='content'>
                <p class='title'>${data.css.toUpperCase()}</p>
                <p class='message'>${data.mensagem}</p>
            </div>
        </div>
    </div>
    `;

    let element = $(html);
    $("#containera").append(element);

    element.addClass('animate__fadeInRight');

    let tempo = data.time || 5000;

    setTimeout(() => {
        element.removeClass('animate__fadeInRight').addClass('animate__fadeOutRight');

        setTimeout(() => {
            element.remove();
            isShowing = false;
            processQueue();
        }, 500);

    }, tempo);
}