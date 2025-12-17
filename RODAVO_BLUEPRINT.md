### INÍCIO DO BLUEPRINT RodaVO V7.6 ###

# RODAVO: BLUEPRINT MESTRE (DOCUMENTO TÉCNICO)
**Versão:** 7.6 (Waypoints Essenciais)
**Data:** Dezembro 2025

## 1. VISÃO DO PRODUTO & PLATAFORMAS
O RodaVO é uma aplicação híbrida para **4 Plataformas Obrigatórias**:
1. **Mobile:** Android & iOS (Experiência completa com Gamificação).
2. **Automotive:** Apple CarPlay & Android Auto (Apenas Navegação Profissional).

## 2. ARQUITETURA TÉCNICA (STACK RIGOROSO)
- **Frontend:** Flutter (Stable Channel).
- **Architecture:** **Clean Architecture** (Presentation, Domain, Data).
- **Compatibilidade:** `minSdkVersion 24` (Android 7.0) e `iOS 13.0`.
- **Stack:** Riverpod, Freezed, GoRouter, HERE SDK, Firebase, Hive, RevenueCat.

## 3. MÓDULOS "CORE" (NAVEGAÇÃO & SEGURANÇA)

### 3.1. Veículos & Pricing (Onboarding)
- **CRÍTICO: Waypoints Essenciais:** O Onboarding deve permitir a inserção de **MÚLTIPLAS PARAGENS OBRIGATÓRIAS** (Waypoints/Checkpoints). A rota calculada pelo HERE SDK deve seguir a sequência **EXATA** definida pelo utilizador.
- **API de Custo:** Esta funcionalidade deve usar o serviço **Truck Routing (Nível 1)** e não o Waypoints Sequencing (Nível 2).
- **GRUPO A (14,99€):** Truck, Bus, RV. API: `TruckSpecifications`.
- **GRUPO B (4,99€):** Car, Moto. API: `CarSpecifications`.
- **Persistência:** Guardar perfil do veículo em Hive (**encriptado**).

### 3.2. Protocolo "SafeGuard" (Segurança Ativa e Custos)
- **Bloqueio UI:** Bloqueia o jogo acima de **15km/h**.
- **Conformidade Contratual:** Se o utilizador sair da rota por mais de **500m**, o ganho de XP/Cash é **pausado**.
- **ECONOMIA DE VELOCIDADE:** O SafeGuard deve obter limites de velocidade da API Truck Routing (Nível 1, custo mais baixo) e só fazer a chamada cara ($5.00/k) quando houver **Alerta de Radar Iminente**.

### 3.3. Smart Shield (Legalidade Dinâmica)
- Alerta de Radar/Perigo adaptado ao `country_code`.

## 4. MÓDULO SOCIAL (REDE SOCIAL)
- **Estrutura:** Perfis (Instagram Style), Feed, Seguidores.

## 5. GAMIFICAÇÃO & ECONOMIA
- **Regra Anti-Missões:** O RodaVO **NÃO GERA** missões fictícias.
- **Recompensa:** Vinculada ao cumprimento da rota real.

### 5.5. PROTOCOLO RODATRUST (REPUTAÇÃO 360º MULTI-VEÍCULO)
- **Propósito:** Biblioteca de dados de POIs para Pesquisa Manual.
- **Recompensa:** 5 R-Coins e 50 Cash por avaliação válida.
- **Ajuste (v7.4->v7.6):** O formulário de avaliação deve registar o **idioma de submissão** (PT, EN, DE, etc.). A visualização deve permitir **pesquisa/filtragem por idioma**.

## 6. DESIGN SYSTEM & PERFORMANCE
- **Modo "Low-Spec" (Automático):** Desliga animações pesadas se RAM/Processador for baixo.

## 7. ENGENHARIA & ROBUSTEZ (CRÍTICO)
- **Anti-Cheat:** Escutar `isMockLocation`.
- **Offline-First:** Ações gravadas em Hive.

### FIM DO BLUEPRINT ###
