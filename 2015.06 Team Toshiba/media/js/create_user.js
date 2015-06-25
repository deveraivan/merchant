/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


Create_request = 
{
    process: function()
    {
        var firstname = $('firstname').val();
        var lastname = $('lastname').val();
        var email = $('email').val();
        var address = $('address').val();
        var gender = $
        var request_item = $('request_item').val();
        
        $.ajax({
            type: 'POST',
                url: 'http://localhost/kohana/index.php/create_request/process_createrequest',
                data: {date_requested: date_requested, date_needed: date_needed,
                        delivery_address: delivery_address, quantity: quantity, 
                        request_item: request_item},
                dataType: 'JSON',
                success: function(data)
                {
                    alert(data);
                }
        });
    },
    click_event: function()
    {
        $('#supply-form').on('click',function(e){
            e.preventDefault();
            Create_request.process();
        });
    }
}

$(document).ready(function()
    {
    Create_request.click_event();
})
                             
                    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


