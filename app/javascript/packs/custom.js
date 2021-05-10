$(document).ready(function(){
    var doc = $('.try')
    doc.click(function(){
        alert(456)
    })

    $('#plus').click(function(e){
        e.preventDefault()
        var getVal = $('#input-quantity').val()
        $('#input-quantity').val(parseInt(getVal) + 1)
    })

    $('#minus').click(function(e){
        e.preventDefault()
        var getVal = $('#input-quantity').val()
        if(getVal > 1){
            $('#input-quantity').val(parseInt(getVal) - 1)
        }
        
    })

    function payWithPaystack(){
        var handler = PaystackPop.setup({
          key: 'pk_test_0dd7a3e7315fec2ee84a52f338daedbca1ab640b',
          email: 'customer@email.com',
          amount: 10000,
          ref: ''+Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
          metadata: {
             custom_fields: [
                {
                    display_name: "Mobile Number",
                    variable_name: "mobile_number",
                    value: "+2348012345678"
                }
             ]
          },
          callback: function(response){
              alert('success. transaction ref is ' + response.reference);
          },
          onClose: function(){
              alert('window closed');
          }
        });
        handler.openIframe();
      }

    $('.paystack-button').click(function(){
        payWithPaystack()
    })
    
})

