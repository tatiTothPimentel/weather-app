# Meu App de Previsão do Tempo

Este é o meu primeiro aplicativo SwiftUI de previsão do tempo, que permite acompanhar o clima de várias cidades. O aplicativo possui várias funcionalidades, incluindo:

- **Adicionar Cidade**: Você pode adicionar uma cidade para verificar a previsão do tempo.

- **Informações da Cidade**: Ao adicionar uma cidade, o aplicativo exibe o nome da cidade, a hora local, a temperatura atual em graus Celsius e informações adicionais, como "sente como", umidade, pressão e velocidade do vento.

- **Previsão Horária**: O aplicativo exibe a previsão horária, atualizada a cada hora, com ícones representando as condições climáticas e a temperatura para cada hora do dia.

- **Previsão para os Próximos 7 Dias**: Você pode verificar a previsão para os próximos 7 dias, incluindo a data, um ícone do clima e a temperatura máxima e mínima para cada dia.

- **Modularização**: O projeto é organizado em módulos para melhor organização e reutilização de código.

- **Gerenciamento de Dependências**: O aplicativo utiliza o Swift Package Manager para gerenciar duas dependências: SDWebImage e SDWebImageSwiftUI.

- **Requisição da API**: Para obter informações meteorológicas, o aplicativo faz uma solicitação à API [OpenWeatherMap](https://openweathermap.org/api/one-call-api) usando URLSession.

- **Depuração com Print no Console**: Ao acessar a previsão para os próximos 7 dias, o aplicativo dispara um print no console relacionado ao módulo criado.

## Como Rodar o Projeto

Para executar este projeto em sua máquina, siga estas etapas:

1. Clone este repositório:

git clone https://github.com/tatiTothPimentel/weather-app.git

2. Abra o projeto no Xcode.

3. Compile e execute o aplicativo em um simulador ou dispositivo iOS.

## Configuração

Antes de executar o aplicativo, certifique-se de configurar suas chaves de API OpenWeatherMap no arquivo de configuração apropriado.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para colaborar, relatar problemas ou fazer melhorias.
