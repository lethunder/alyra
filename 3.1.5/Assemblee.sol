pragma solidity ^0.5.7;
contract Assemblee {
    address[] membres;
    address[] admins;
    struct Decision {
       string description;
       uint votesPour;
       uint votesContre;
       mapping (address => bool) aVote;
   }
   Decision[] decisions;
   Decision decisionSimple;
   string public nomAssemblee;
    
        
    constructor(string memory nom) public {
        nomAssemblee = nom;
        admins.push(msg.sender);
    }
    
    function estAdmin(address admin) public view returns (bool) {
        for (uint i=0 ; i<admins.length ; i++) {
            if (admins[i]==admin) {
                return true;
            }
        }
        return false;
    }
    
    function nommerAdmin(address admin) public {
        require(estAdmin(msg.sender));
        require(estAdmin(admin) == false);
        admins.push(admin);
    }
    
    
    function remercierAdmin(address admin) public {

        require(estAdmin(msg.sender));

        require(admins.length > 1);

        for (uint i=0 ; i<admins.length ; i++) {

            if (admins[i]==admin) {
				admins[i] = admins[admins.length - 1];
				admins.length--;
                break;
            }
        }
    }
    
    function fermerDecision(uint vote) public {
        require(vote < decisions.length);
        require(estAdmin(msg.sender));

		decisions[vote] = decisions[decisions.length - 1];
    }
    
    function rejoindre() public {
        if(estMembre(msg.sender)!= true){
            membres.push(msg.sender);
        }
    }
     
    function estMembre(address utilisateur) public view returns (bool) {
        for (uint i=0; i<membres.length; i++) {
            if(membres[i] == utilisateur){
                return true;
            } 
        }
    }
    
    function proposerDecision(string memory description) public {
        if(estMembre(msg.sender)){
            decisionSimple.description = description;
            decisionSimple.votesPour = 0;
            decisionSimple.votesContre = 0;
            decisions.push(decisionSimple);
        }
    }
     
    function voter(uint indice, bool value) public {
        if(estMembre(msg.sender) && decisions[indice].aVote[msg.sender] == false){
            if(value == true){
                decisions[indice].votesPour+=1;
            }else{
                decisions[indice].votesContre+=1;
            }
            decisions[indice].aVote[msg.sender] = true;
        }
    }

    function comptabiliser(uint indice) public view returns (int){
        return int(decisions[indice].votesPour - decisions[indice].votesContre);
    }
}