const pay = () => {
  // const url = location.href; 
  // if(url.match('cards')){  
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
      const submit = document.getElementById("card_button"); 
      submit.addEventListener("click", (e) => { // イベント発火
      e.preventDefault();

      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      console.log(formResult)

      const card = {
        number: formData.get("number"),
        cvc: formData.get("cvc"),
        exp_month: formData.get("exp_month"),
        exp_year: `20${formData.get("exp_year")}`,
      };
      // debugger;
      console.log(card)
      // debugger;
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='card_token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        // console.log(card)
        // debugger;

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        console.log("ok")
        // debugger;
       });
      });
  //  };
};

window.addEventListener("load", pay);
