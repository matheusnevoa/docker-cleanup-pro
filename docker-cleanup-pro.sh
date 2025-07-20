#!/bin/bash

# ==========================================
# 🧹 DOCKER CLEANUP PRO v1.0
# ==========================================
# Script profissional para limpeza Docker
# Compatível com Docker & Portainer
# Criado por: Matheus Névoa
# Linkedin: https://www.linkedin.com/in/matheusnevoa/
# Github: https://github.com/matheusnevoa
# Atualizado em: Julho de 2025
# ==========================================

# Cores para output bonito
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

# Função para exibir banner
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "╔════════════════════════════════════════════════╗"
    echo "║              🐳 DOCKER CLEANUP PRO             ║"
    echo "║                    v1.0                        ║"
    echo "╚════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${WHITE}🚀 Script profissional para limpeza e otimização Docker${NC}"
    echo -e "${WHITE}🤖 Criado por Matheus Névoa - nevoaia.com // linkedin.com/in/matheusnevoa ${NC}"
    echo -e "${YELLOW}⚡ Libere espaço, remova containers órfãos e otimize performance${NC}"
    echo ""
}

# Função para mostrar espaço em disco
show_disk_usage() {
    echo -e "${BLUE}📊 ANÁLISE ATUAL DO SISTEMA:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Espaço Docker
    echo -e "${WHITE}🐳 Uso do Docker:${NC}"
    docker system df 2>/dev/null || echo "Docker não encontrado ou não está rodando"
    
    echo ""
    # Espaço do sistema
    echo -e "${WHITE}💾 Espaço em disco:${NC}"
    df -h / | tail -1 | awk '{print "Usado: " $3 " / " $2 " (" $5 ")"}'
    
    echo ""
}

# Função para contar recursos
count_resources() {
    containers=$(docker ps -aq 2>/dev/null | wc -l)
    images=$(docker images -q 2>/dev/null | wc -l)
    volumes=$(docker volume ls -q 2>/dev/null | wc -l)
    networks=$(docker network ls -q 2>/dev/null | wc -l)
    
    echo -e "${WHITE}📋 RECURSOS DOCKER ENCONTRADOS:${NC}"
    echo "• Containers: $containers"
    echo "• Imagens: $images" 
    echo "• Volumes: $volumes"
    echo "• Redes: $networks"
    echo ""
}

# Função para limpeza básica
basic_cleanup() {
    echo -e "${GREEN}🧽 Executando limpeza básica...${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    echo "• Removendo containers parados..."
    docker container prune -f
    
    echo "• Removendo redes não utilizadas..."
    docker network prune -f
    
    echo "• Removendo imagens dangling..."
    docker image prune -f
    
    echo -e "${GREEN}✅ Limpeza básica concluída!${NC}"
    echo ""
}

# Função para limpeza avançada
advanced_cleanup() {
    echo -e "${YELLOW}🧼 Executando limpeza avançada...${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    echo "• Removendo volumes órfãos..."
    docker volume prune -f
    
    echo "• Removendo todas imagens não utilizadas..."
    docker image prune -a -f
    
    echo "• Limpando cache de build..."
    docker builder prune -f
    
    echo -e "${YELLOW}✅ Limpeza avançada concluída!${NC}"
    echo ""
}

# Função para limpeza total
total_cleanup() {
    echo -e "${RED}🔥 Executando limpeza TOTAL...${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${RED}⚠️  ATENÇÃO: Isto remove TUDO que não está em uso!${NC}"
    
    read -p "Tem certeza? (s/N): " confirm
    if [[ $confirm =~ ^[Ss]$ ]]; then
        echo "• Executando limpeza completa do sistema..."
        docker system prune -a --volumes -f
        echo -e "${RED}✅ Limpeza total concluída!${NC}"
    else
        echo -e "${CYAN}❌ Limpeza total cancelada pelo usuário${NC}"
    fi
    echo ""
}

# Função para mostrar relatório final
show_final_report() {
    echo -e "${PURPLE}📈 RELATÓRIO FINAL:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Espaço após limpeza
    echo -e "${WHITE}🐳 Uso do Docker após limpeza:${NC}"
    docker system df 2>/dev/null || echo "Docker não disponível"
    
    echo ""
    # Recursos restantes
    count_resources
    
    # Espaço em disco
    echo -e "${WHITE}💾 Espaço livre no sistema:${NC}"
    df -h / | tail -1 | awk '{print "Disponível: " $4 " (" $5 " usado)"}'
    echo ""
}

install_globally() {
    echo -e "${CYAN}🔗 Instalando script globalmente...${NC}"
    TARGET_DIR="/usr/local/bin"
    SCRIPT_NAME="docker-cleanup-pro"

    if [[ ! -f "$0" ]]; then
        echo -e "${RED}❌ Caminho do script não encontrado. Instalação abortada.${NC}"
        return
    fi

    # Detecta se sudo está disponível
    if command -v sudo &> /dev/null; then
        sudo cp "$0" "$TARGET_DIR/$SCRIPT_NAME"
        sudo chmod +x "$TARGET_DIR/$SCRIPT_NAME"
    else
        cp "$0" "$TARGET_DIR/$SCRIPT_NAME" || {
            echo -e "${RED}❌ Falha ao copiar sem sudo. Execute como root ou instale manualmente.${NC}"
            return
        }
        chmod +x "$TARGET_DIR/$SCRIPT_NAME"
    fi

    echo -e "${GREEN}✅ Instalação concluída! Agora você pode executar com: ${WHITE}$SCRIPT_NAME${NC}"
    echo ""
}

check_directory_conflict() {
    local base_name
    base_name=$(basename "$0")
    if [[ -d "./$base_name" ]]; then
        echo -e "${YELLOW}⚠️  Você está dentro de um diretório chamado '${base_name}', que conflita com o nome do script.${NC}"
        echo -e "${CYAN}💡 Saia da pasta ou renomeie o diretório para evitar conflitos de execução.${NC}"
    fi
}

# Função do menu interativo
show_menu() {
    echo -e "${WHITE}🎯 ESCOLHA O TIPO DE LIMPEZA:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}1)${NC} 🧽 Limpeza Básica (containers parados, redes, imagens dangling)"
    echo -e "${YELLOW}2)${NC} 🧼 Limpeza Avançada (+ volumes órfãos, todas imagens não usadas)"
    echo -e "${RED}3)${NC} 🔥 Limpeza Total (REMOVE TUDO que não está em uso)"
    echo -e "${BLUE}4)${NC} 📊 Apenas mostrar análise do sistema"
    echo -e "${MAGENTA}5)${NC} 🔗 Instalar script globalmente (/usr/local/bin)"
    echo -e "${CYAN}6)${NC} ❌ Sair"
    echo ""
    read -p "Digite sua opção (1-6): " choice
}

# Função principal
main() {
    # Verificar se Docker está instalado
    if ! command -v docker &> /dev/null; then
        echo -e "${RED}❌ Docker não encontrado! Instale o Docker primeiro.${NC}"
        exit 1
    fi

     # Verificar se está em Windows puro
    IS_WINDOWS=false
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]; then
    IS_WINDOWS=true
    fi

    # Verificar se Docker está em execução
    if ! docker info &> /dev/null; then
        echo -e "${RED}❌ Docker encontrado, mas o serviço não está em execução.${NC}"
        echo -e "${YELLOW}🟡 Verifique se o Docker Desktop está iniciado e tente novamente.${NC}"
        exit 1
    fi
    
    show_banner
    check_directory_conflict
    show_disk_usage
    count_resources
    
    while true; do
        show_menu
        
        case $choice in
            1)
                basic_cleanup
                show_final_report
                ;;
            2)
                basic_cleanup
                advanced_cleanup
                show_final_report
                ;;
            3)
                basic_cleanup
                advanced_cleanup
                total_cleanup
                show_final_report
                ;;
            4)
                show_disk_usage
                count_resources
                ;;
            5)  
                if [[ "$IS_WINDOWS" == true ]]; then
                    echo -e "${RED}❌ Instalação global não é suportada em Windows nativo.${NC}"
                    echo -e "${YELLOW}Use o script com 'bash docker-cleanup-pro.sh' no terminal.${NC}"
                    echo -e "${CYAN}💡 Ou execute via WSL para habilitar instalação global.${NC}"
                else
                    install_globally
                fi
                ;;
            6)
                echo -e "${CYAN}👋 Obrigado por usar o Docker Cleanup Pro!${NC}"
                echo -e "${WHITE}🤖 Criado por Matheus Névoa - nevoaia.com // linkedin.com/in/matheusnevoa ${NC}"
                echo -e "${WHITE}🌟 Se este script foi útil, compartilhe com seus amigos!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}❌ Opção inválida! Tente novamente.${NC}"
                sleep 2
                ;;
        esac
        
        echo ""
        read -p "Pressione Enter para continuar..."
        clear
        show_banner
    done
}

# Executar script
main
