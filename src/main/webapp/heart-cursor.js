(function () {
    const style = document.createElement("style");
    style.textContent = `
        * { cursor: none !important; }
        #heart-cursor-el { position: fixed; top: 0; left: 0; pointer-events: none; z-index: 99999; }
        .mini-heart-trail {
            position: fixed; pointer-events: none; z-index: 99998;
            font-size: 11px;
            animation: miniHeartFloat 0.8s ease-out forwards;
        }
        @keyframes miniHeartFloat {
            0%   { opacity: 1; transform: translateY(0) scale(1); }
            100% { opacity: 0; transform: translateY(-50px) scale(0.2); }
        }
    `;
    document.head.appendChild(style);

    const wrap = document.createElement("div");
    wrap.id = "heart-cursor-el";
    wrap.innerHTML = `
    <svg width="32" height="30" viewBox="0 0 32 30" xmlns="http://www.w3.org/2000/svg">
      <path d="M16 28 C16 28, 2 18, 2 9 C2 4.5, 5.5 1, 9.5 1 C12.5 1, 15 2.8, 16 5 C17 2.8, 19.5 1, 22.5 1 C26.5 1, 30 4.5, 30 9 C30 18, 16 28, 16 28 Z"
            fill="#C0392B" stroke="#8B0000" stroke-width="1"/>
      <ellipse cx="11" cy="8" rx="3.5" ry="2" fill="white" opacity="0.25" transform="rotate(-20 11 8)"/>
    </svg>`;
    document.body.appendChild(wrap);

    const hearts = ['❤️','💕','💗','💖','💝','💘','🩷'];
    let last = 0;

    document.addEventListener('mousemove', function (e) {
        wrap.style.left = (e.clientX - 16) + 'px';
        wrap.style.top  = (e.clientY - 15) + 'px';

        const now = Date.now();
        if (now - last > 150) {
            last = now;
            const h = document.createElement('div');
            h.className = 'mini-heart-trail';
            h.textContent = hearts[Math.floor(Math.random() * hearts.length)];
            h.style.left = (e.clientX + Math.random() * 20 - 10) + 'px';
            h.style.top  = (e.clientY + Math.random() * 10) + 'px';
            document.body.appendChild(h);
            setTimeout(() => h.remove(), 800);
        }
    });
})();