import 'package:desafio_supera_flutter/models/carousel_item.dart';
import 'package:desafio_supera_flutter/models/game_item.dart';

final dummyGames = [
  GameItem(
    id: '312',
    name: 'Super Mario Odyssey',
    price: 197.88,
    score: 100,
    image: 'super-mario-odyssey.png',
    description:
        'Graças ao heroico Cappy, o Mario ganhou novos movimentos que vão fazer você repensar a tradicional jogabilidade de corrida-e-pulo – como jogar ou saltar o Cappy, e capturar elementos. Use as capturas de inimigos, objetos e animais para progredir e descobrir um monte de colecionáveis escondidos. E se você quiser jogar com um amigo, é só passar a ele um controle Joy-Con™! O jogador 1 vai controlar o Mario, e o jogador 2, o Cappy. Essa aventura de mundo aberto em 3D – a primeira desde o Super Mario 64™ de 1996 e do clássico Super Mario Sunshine™ para Nintendo GameCube™ de 2002 – está cheia de segredos, surpresas e novos reinos para se explorar.',
  ),
  GameItem(
    id: '201',
    name: 'Call Of Duty Infinite Warfare',
    price: 49.99,
    score: 80,
    image: 'call-of-duty-infinite-warfare.png',
    description:
        'Infinite Warfare possui três modos de jogo únicos: a campanha é um retorno às duras raízes militares da franquia, sem deixar de olhar para frente. O multijogador traz o futuro da guerra, com várias inovações na jogabilidade. E o modo cooperativo Zumbis leva os jogadores em uma louca viagem em uma nova história com recursos e mecânicas de jogabilidade únicas.',
  ),
  GameItem(
    id: '102',
    name: 'The Witcher III Wild Hunt',
    price: 119.5,
    score: 250,
    image: 'the-witcher-iii-wild-hunt.png',
    description:
        'The Witcher 3: Wild Hunt é um RPG de mundo aberto, ambientado em um mundo fantástico cheio de escolhas importantes e consequências de impacto. Em The Witcher 3, você joga como o caçador de monstros profissional Geralt de Rívia, que está em busca da criança da profecia em um vasto mundo aberto, rico em cidades mercantis, ilhas com piratas, passagens perigosas por montanhas e cavernas esquecidas a serem exploradas.',
  ),
  GameItem(
    id: '99',
    name: 'Call Of Duty WWII',
    price: 249.99,
    score: 205,
    image: 'call-of-duty-wwii.png',
    description:
        'A série Call of Duty retorna às raízes com Call of Duty®: WWII, uma experiência espetacular que redefine a Segunda Guerra Mundial para uma nova geração de jogadores. Desembarque na Normandia no Dia D e participe de batalhas por toda a Europa em lugares icônicos da guerra mais monumental da história. Experimente o clássico combate de Call of Duty, os laços de camaradagem, e a natureza implacável da guerra.',
  ),
  GameItem(
    id: '12',
    name: 'Mortal Kombat XL',
    price: 69.99,
    score: 150,
    image: 'mortal-kombat-xl.png',
    description:
        'Um dos jogos mais vendidos de 2015, agora em tamanho XG! Komplete a experiência de Mortal Kombat X com conteúdos novos e já lançados. Jogo completo e os novos personagens controláveis: Alien, Leatherface, Triborg e Bo\' Rai Cho. Os já lançados anteriormente são: o Predador, Jason Voorhees, Tremor, Tanya e Goro. Inclusos também o novo pacote de skins Apocalíptico.',
  ),
  GameItem(
    id: '74',
    name: 'Shards of Darkness',
    price: 71.94,
    score: 400,
    image: 'shards-of-darkness.png',
    description:
        'Styx retorna em uma nova aventura furtiva!\n\nContratado para uma missão crítica, explore e domine um vasto ambiente aberto como Styx, só ou com um amigo. Assassine ou mova-se sorrateiramente entre inimigos - humanos, elfos, anões e também criaturas assustadoras e colossais - e experimente a nova coleção de habilidades e armas letais no seu arsenal de assassino goblin. Gaste pontos de experiência em assassinato, infiltração e mágica para aprender novas técnicas e melhorar habilidades. Explore, recupere artefatos valiosos e ingredientes para criar armadilhas mortais e itens úteis, e crie seus clones para enganar inimigos.',
  ),
  GameItem(
    id: '31',
    name: 'Terra Média: Sombras de Mordor',
    price: 79.99,
    score: 50,
    image: 'terra-media-sombras-de-mordor.png',
    description:
        'Em Middle-Earth: Shadow of Mordor, cada encontro entre personagens fica registrado no game, bem como quem venceu ou perdeu. Se o protagonista for derrotado por um orc, por exemplo, a criatura vai lembrá-lo de que já o matou antes, e que pode fazê-lo novamente. Junte está mecânica a criaturas com um comportamento único e pode esperar muita variação nas batalhas.',
  ),
  GameItem(
    id: '420',
    name: 'FIFA 18',
    price: 195.39,
    score: 325,
    image: 'fifa-18.png',
    description:
        'Com a tecnologia Frostbite, o EA SPORTS FIFA 18 elimina o limite entre o mundo virtual e o real, dando vida aos jogadores, times e climas envolventes do maior esporte do mundo. Use a Tecnologia de Movimentação Real de Jogadores para vivenciar os Momentos mais Emocionantes nos intensos Climas Envolventes do mundo do futebol. Acompanhe uma trajetória global com o elenco de craques que participam de "A Jornada: A Volta de Hunter". No FIFA Ultimate Team, os Ídolos do FUT trazem Ronaldo Nazário e outras lendas do futebol para o FIFA 18.',
  ),
  GameItem(
    id: '501',
    name: 'Horizon Zero Dawn',
    price: 115.8,
    score: 290,
    image: 'horizon-zero-dawn.png',
    description:
        ' Embarque em uma jornada envolvente e emocional e descubra mistérios de sociedades tribais, artefatos da antiguidade e tecnologias avançadas que determinarão o destino deste planeta e da própria vida. Um exuberante mundo pós-apocalíptico: como as máquinas dominaram esse mundo e o que pretendem? o que aconteceu com a civilização que habitava esse lugar? vasculhe cada canto de um reino repleto de relíquias antigas e construções misteriosas para desvendar o passado e desenterrar os vários segredos de uma terra esquecida. Natureza e máquinas em conflito: horizon zero dawn mistura dois elementos contrastantes, combinando um mundo vibrante repleto de belezas naturais e uma impressionante tecnologia avançada. Essa fusão cria uma combinação dinâmica de exploração e gameplay.',
  )
];

final dummyCarouselItems = [
  CarouselItem(
    id: 1,
    image: 'call-of-duty-infinite-warfare.jpg',
    title: 'Tenha experiências insanas no modo multiplayer.',
  ),
  CarouselItem(
    id: 2,
    image: 'fifa-18.jpg',
    title: 'Faça gols incríveis com Cristiano Ronaldo.',
  ),
  CarouselItem(
    id: 3,
    image: 'mortal-kombat-xl.jpeg',
    title: 'Derrote seus amigos com Fatalities surreais',
  ),
  CarouselItem(
    id: 4,
    image: 'super-mario-odyssey.jpeg',
    title: 'Explore lugares incríveis com o Mario e o novo aliado Cappy',
  ),
];
