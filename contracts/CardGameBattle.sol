// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

contract CardBattleGame is Ownable, EIP712 {
    IERC721Enumerable public nftCollection;

    uint256 public nextBattleId;

    enum CharacterClass { BARBARIAN, KNIGHT, RANGER, ROGUE, WIZARD, CLERIC }

    // structure de données des joueurs
    struct Player {
        string name; // ASSIGNMENT #1 (la vairable qui stocke une chaine de caractères = string)
        address playerAddress;
        uint256 totalWins;
        uint256 totalLosses; 
        uint256 experience;  
        mapping(uint256 => CharacterStats) characterStats; 
    }

    // Struture de données des personnages du jeu
    struct CharacterStats {
        CharacterClass class;
        uint256 level;
        uint256 exp;
        uint256 health;
        uint256 mana; // ASSIGNMENT #2 (la variable qui stocke uniquement les entiers positif = uint (unsigned integer))
        uint256 attack;
        uint256 defense;
        uint256 wins;
        uint256 losses;
    }

    // Structuure de données des challenges
    struct Battle { // ASSIGNMENT #3 (la directive de précompilation/programmation = struct (est celle qui permet de créer une structure de données))
        string name;
        address player1;
        address player2;
        uint256 player1TokenId;
        uint256 player2TokenId;
        uint256 startTime;
        bool resolved;
    }

    //Mapping des données
    // Ces 3 lignes permettent de compter toutes les parties : (avec les données (address + IDs) sur les joueurs + les rounds effectués)
    bytes32 private constant RESOLVE_BATTLE_TYPEHASH = keccak256("ResolveBattle(uint256 battleId,address _player2, bool isComputer,uint256 _player1TokenId,uint256 _player2TokenId,address _winner,uint256 _winnerExp,uint256 _loserExp)");    uint256 public totalBattle;
    mapping(address => Player) public players; // ASSIGNMENT #4 (la structure de données qui renferme l'adresse des joeurs = Player)
    mapping(uint256 => Battle) public battles;

    //Gestion des Evènements
    //Ces 3 lignes permettent d'émettre les informations (pouvant être exploitées par d'autres applications) quand il y a : inscription d'un joueur, création d'une challenge, fin d'une challenge
    event PlayerRegistered(address indexed playerAddress, string name); // ASSIGNMENT #5 (il fallait remettre le mot clé = string (devant name))
    event BattleRegistered(uint256 indexed battleId, string name, address indexed player1);
    event BattleResolved(uint256 indexed battleId, address indexed winner, address indexed loser, uint256 winnerExp, uint256 loserExp);

    constructor(address _nftCollectionAddress) EIP712("CardBattleGame", "1") Ownable(msg.sender) {
        nftCollection = IERC721Enumerable(_nftCollectionAddress);
        totalBattle = 0;
        nextBattleId = 1;
    }


    // La fonction qui permet l'inscription d'un joueur
    function registerPlayer(string memory _name) external {
    }

    // La fonction qui permet l'inscription d'une challenge
    function registerBattle(string memory _battleName) external returns (uint256) {
    }

    // La fonction qui permet d'avoir les résultats d'une challenge qui a étét inscrite
    function resolveBattle(
        uint256 _battleId,
        address _player2,
        bool isComputer,
        uint256 _player1TokenId,
        uint256 _player2TokenId,
        address _winner,
        uint256 _winnerExp,
        uint256 _loserExp,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {

    }

    // La fonction qui permet de mettre à jour les statistique d'une challenge
    function _updateBattleStats(uint256 _battleId, address _winner, uint256 _winnerExp, uint256 _loserExp) private {
    }

    // La fonction qui permet de mettre à niveau (Leveling Up) les personnages du jeu vidéo
    function _levelUp(CharacterStats storage stats) private {
    }


    // Helper functions
    // (View) : keyword only allows you to read from the contract but does not allow the user to modify the state of the contract.
    // (Pure) : keyword restricts the functions and does not allow the user to change any state variable of the contract nor read anything from the contract.
    function isPlayer(address addr) public view returns (bool) {
    }

    function getBaseHealth(CharacterClass _class) public pure returns (uint256) {
    }

    function getBaseMana(CharacterClass _class) public pure returns (uint256) {
    }

    function getBaseAttack(CharacterClass _class) public pure returns (uint256) {
    }

    function getBaseDefense(CharacterClass _class) public pure returns (uint256) {
    }

    function getCharacterStats(address _player, uint256 _tokenId) external view returns (CharacterStats memory) {
    }

    function getRequiredExp(uint256 _level) public pure returns (uint256) {
    }
}
