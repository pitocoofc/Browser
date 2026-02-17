<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Discord Clone - Mobile Style</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="app-container">
        <aside class="server-sidebar">
            <div class="server-icon active"><img src="home-icon.png"></div>
            <div class="divider"></div>
            <div class="server-icon"><img src="server1.png"></div>
            <div class="server-icon"><img src="server2.png"></div>
            </aside>

        <main class="main-content">
            <header class="header">
                <h1>Mensagens</h1>
                <div class="search-bar">🔍 Pesquisar</div>
            </header>

            <section id="friends-list" class="friends-container">
                <div class="empty-state">
                    <p>Nossa... Você não adicionou ninguém</p>
                    <button onclick="abrirTelaAdicionar()" class="btn-add">Adicionar Amigo</button>
                </div>
            </section>

            <nav class="bottom-nav">
                <div class="nav-item">🏠 <span>Início</span></div>
                <div class="nav-item">🔔 <span>Notificações</span></div>
                <div class="nav-item user-profile">👤 <span>Você</span></div>
            </nav>
        </main>
    </div>

    <div id="modal-add" class="modal">
        <div class="modal-content">
            <h2>Adicionar Amigo</h2>
            <input type="text" id="username-input" placeholder="Nome do usuário...">
            <button onclick="adicionarAmigo()">Adicionar</button>
            <button onclick="fecharModal()">Cancelar</button>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
