# 🧹 Docker Cleanup Pro

**Versão:** 1.1
**Autor:** [Matheus Névoa](https://www.linkedin.com/in/matheusnevoa)  
**Site:** [nevoaia.com](https://nevoaia.com)

Script interativo e profissional para limpeza e otimização do Docker.  
Ideal para desenvolvedores e administradores que utilizam Docker ou Portainer e desejam liberar espaço, remover recursos órfãos e manter o ambiente limpo e performático.

**🌐 Suporte Multi-plataforma:** Linux, macOS e Windows

---

## 📦 O que esse script faz?

Este script permite executar **3 tipos de limpeza**:

1. **🧽 Limpeza Básica**
   - Remove containers parados
   - Remove redes não utilizadas
   - Remove imagens dangling

2. **🧼 Limpeza Avançada**
   - Tudo da limpeza básica +
   - Remove volumes órfãos
   - Remove imagens não utilizadas
   - Limpa cache de build

3. **🔥 Limpeza Total**
   - Remove todos os recursos não utilizados
   - Containers, imagens, volumes e redes

---

## 🚀 Como usar

### 🐧 Linux / macOS

1. **Clone o repositório**

```bash
git clone https://github.com/matheusnevoa/docker-cleanup-pro.git
cd docker-cleanup-pro
```

2. **Torne o script executável**

```bash
chmod +x docker-cleanup-pro.sh
```

3. **Execute o script**

```bash
./docker-cleanup-pro.sh
```

### 🪟 Windows

Para Windows, você tem várias opções de execução:

#### Opção 1: PowerShell Wrapper (Recomendado)
```powershell
# Execute o PowerShell como Administrador
.\docker-cleanup-pro.ps1

# Ou force o uso de uma ferramenta específica:
.\docker-cleanup-pro.ps1 -UseWSL      # Força uso do WSL
.\docker-cleanup-pro.ps1 -UseGitBash  # Força uso do Git Bash
```
> 💡 **O wrapper PowerShell detecta automaticamente** se você tem WSL ou Git Bash instalado e executa o script da melhor forma disponível.

#### Opção 2: Via WSL (Windows Subsystem for Linux)
```bash
wsl bash docker-cleanup-pro.sh
```

#### Opção 3: Via Git Bash
```bash
# No Git Bash
./docker-cleanup-pro.sh
```

**Pré-requisitos para Windows:**
- Docker Desktop instalado e funcionando
- Uma das seguintes opções:
  - WSL (Windows Subsystem for Linux) - Recomendado
  - Git for Windows (inclui Git Bash)
  - PowerShell (nativo do Windows)

---

## 📊 Recursos

- **🌐 Detecção automática do sistema operacional**
- **🎨 Interface colorida e amigável**  
- **📈 Relatórios detalhados de uso de disco**
- **📋 Contadores de recursos Docker**
- **⚠️ Confirmação para operações destrutivas**
- **🐳 Compatibilidade com Portainer**

---

## ⚠️ Avisos importantes

- **Sempre faça backup** de dados importantes antes da limpeza
- A **Limpeza Total** remove todos os recursos não utilizados
- Teste primeiro em ambiente de desenvolvimento
- Para ambientes de produção, use a **Limpeza Básica**

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

- Reportar bugs
- Sugerir melhorias  
- Enviar pull requests
- Compartilhar o projeto

---

## 📄 Licença

Este projeto é de código aberto. Use livremente! 

---

## 👨‍💻 Autor

**Matheus Névoa**
- 🌐 Website: [nevoaia.com](https://nevoaia.com)
- 💼 LinkedIn: [linkedin.com/in/matheusnevoa](https://www.linkedin.com/in/matheusnevoa)
- 🐙 GitHub: [github.com/matheusnevoa](https://github.com/matheusnevoa)

## 👥 Contribuições
- **David Molizane**
   - 💼 LinkedIn: [linkedin.com/in/david-molizane](https://www.linkedin.com/in/david-molizane/)
   - 🐙 GitHub: [github.com/molizanee](https://github.com/Molizanee)

---

💡 **Se este script foi útil para você, considere dar uma ⭐ no repositório!**
