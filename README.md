# Terraform module example

Esse repositório tem como objetivo principal servir como referência para o desenvolvimento
de módulos para o terraform.

## O que você irá encontrar nesse repositório

- Estrutura inicial para a criação do um módulo do terraform
- Exemplos de como utilizar o [terratest](https://terratest.gruntwork.io/) para testar o módulo
- Pipeline do Circle CI para a execução de todo o ciclo de desenvolvimento e release de um módulo

## Entendendo o ciclo de desenvolvimento e release

Nós utilizamos o [Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) para o desenvolvimento e release dos módulos. 

Esse fluxo consiste basicamente na utilização de um único branch principal, onde todos os pull requests são mergeados.

Ao abrir um pull request um pipeline será criado, ele irá executar todos os testes definidos no diretório `/test` do repositório. Esses testes devem passar para que seja possível a realização do merge.

Após o merge para o branch principal um novo pipeline será criado, novos testes serão executados e se passarem darão inicio a etapa de release, onde a ferramenta [Semantic Release](https://github.com/semantic-release/semantic-release) irá analisar todos os commits e automaticamente montar o changelog e criar a tag/release do módulo.

## Rodando os testes localmente

Para rodar os testes localmente é preciso que as ferramentas definidas no arquivo `.tool-versions` estejam instaladas. Para facilitar essas instalações vocês podem instalar a ferramenta [asdf](https://github.com/asdf-vm/asdf) e rodar o comando `make` na raiza do repositório.

## Referências

- [Terratest](https://github.com/gruntwork-io/terratest)
- [Semantic Release](https://github.com/semantic-release/semantic-release)
- [Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)