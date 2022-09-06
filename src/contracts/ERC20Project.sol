// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
interface ERC20Interface{
    function totalSupply() external view returns(uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function transfer(address to,uint tokens) external returns(bool success);


     function allowance(address tokenOwner,address spender) external view returns(uint remaining);
     function approve(address spender,uint tokens) external returns (bool success);
     function tranferFrom(address from,address to,uint tokens) external returns (bool success);


    event Transfer(address indexed from, address indexed to, uint token);
    event Approval(address indexed tokenOwner,address indexed spender,uint tokens);



}


contract ERC20 is ERC20Interface{
    
    string public name = "Cryptos";
    string public symbol= "CRPT";
    uint public decimals = 0; //18
    // total supply - represent the toral number of tokens
    uint public override totalSupply; // a getter function will be created bcz the variable is public

    address public founder;
    // map to store each address and no of tokens with respect to it
    mapping(address=>uint) public balances;
   

   constructor(){
    totalSupply= 1000000;
    founder = msg.sender;
    balances[founder] = totalSupply;
   }


// first - this mapping includes the accounts approved tp withdraw from a 
// account together with the withdrawal sum allowed for wach of them

// first mapping is the key - the address of the token holder
// second map inside it - is representing the addresses that are allowed to transfer

   mapping(address=>mapping(address=>uint)) public allowed;


      function balanceOf(address tokenOwner) public view override returns (uint balance){
        return balances[tokenOwner];
      }
  
 function transfer(address to,uint tokens) public override returns(bool success){
      
       require(balances[msg.sender]>=tokens,"not enough balance available to tranfer");
       
       balances[to] +=tokens;
       balances[msg.sender] -= tokens;

       emit Transfer(msg.sender, to, tokens);
       return true;
 }



  function tranferFrom(address from,address to,uint tokens) public override returns (bool success){
    
  }


   function allowance(address tokenOwner,address spender) public view override returns(uint remaining){
    return allowed[tokenOwner][spender];
   }


// this functiokn will be called by token owner to set the allowance
// whick is the ammount that can be spent by the spender of this account

  function approve(address spender,uint tokens) public override returns (bool success){
  
  }
     

    


}