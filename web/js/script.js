function menu(){
    const checkbox=document.querySelector("#check").checked;
    const menu=document.querySelector("#list");

 
      menu.classList.toggle('esconder'); 
  
    
}
let left=0;
let cont=0;
function move(value){
    const itemstyle=document.querySelector(".items");
    const itensnumb=document.querySelectorAll(".film-content").length;
  
    if(left>0){
      left=0;
  }
    if(value==='return'){
      left+=200;
    }
  if(value==='go'){
      left-=200;
    cont+=1;
    }
  if(left<-itensnumb*140){
      left=-itensnumb*140;
  }
    return  itemstyle.style=`left: ${left}px`;
 
}
