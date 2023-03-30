//Get Transaction Type
const transactType = document.getElementById('transact-type');

//Get Transaction Forms
const paymentCard = document.getElementsByClassName('payment-card')[0];
const transferCard = document.getElementsByClassName('transfer-card')[0];
const depositCard = document.getElementsByClassName('deposit-card')[0];
const withdrawCard = document.getElementsByClassName('withdraw-card')[0];

//Check for transaction type event listener
transactType.addEventListener('change', () => {
    //Check for transaction type and display form
    switch(transactType.value) {
        case 'payment': 
            paymentCard.style.display = 'block';
            transferCard.style.display = 'none';
            depositCard.style.display = 'none';
            withdrawCard.style.display = 'none';
        break;

        case 'transfer': 
            transferCard.style.display = 'block';
            paymentCard.style.display = 'none';
            depositCard.style.display = 'none';
            withdrawCard.style.display = 'none';
        break;

        case 'deposit': 
            depositCard.style.display = 'block';
            paymentCard.style.display = 'none'; 
            transferCard.style.display = 'none';
            withdrawCard.style.display = 'none';
        break;

        case 'withdraw': 
            withdrawCard.style.display = 'block';
            paymentCard.style.display = 'none';
            depositCard.style.display = 'none';
            transferCard.style.display = 'none';
        break;

        default:
            withdrawCard.style.display = 'none';
            paymentCard.style.display = 'none';
            depositCard.style.display = 'none';
            transferCard.style.display = 'none';
        break;
    }
    //End of Check for transaction type and display form

});
//End of Check for transaction type event listener