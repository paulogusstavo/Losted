/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function getPesquisa () {
  var pesquisa = document.getElementById("search").value;
  window.location.href = "ObjetoController?pesquisa=" + pesquisa;
}
