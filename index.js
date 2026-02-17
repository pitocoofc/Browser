/**
 * Ghost OS - Cloud Bridge Renderer
 * Este código deve ficar no seu segundo repositório.
 */

async function getSiteHTML(targetUrl) {
    // Usamos um proxy público como ponte (AllOrigins é o mais estável)
    const proxy = "https://api.allorigins.win/raw?url=";
    
    try {
        const response = await fetch(proxy + encodeURIComponent(targetUrl));
        let html = await response.text();

        // LIMPEZA DE SEGURANÇA:
        // Removemos scripts que tentam detectar se o site está em iframe
        html = html.replace(/window\.top !== window\.self/g, "false");
        html = html.replace(/if \(top !== self\)/g, "if (false)");
        
        // CORREÇÃO DE LINKS:
        // Adicionamos a tag <base> para que imagens e CSS carreguem do site original
        const baseTag = `<base href="${targetUrl}">`;
        
        return baseTag + html;
    } catch (err) {
        return `<h2>Erro Ndj-Cloud: Não foi possível ler a página em ${targetUrl}</h2>`;
    }
}

// Escuta mensagens do OS principal
window.addEventListener('message', async (event) => {
    if (event.data.type === 'FETCH_URL') {
        const content = await getSiteHTML(event.data.url);
        // Devolve o HTML limpo para o WebOS
        event.source.postMessage({ type: 'RENDER_HTML', html: content }, "*");
    }
});
