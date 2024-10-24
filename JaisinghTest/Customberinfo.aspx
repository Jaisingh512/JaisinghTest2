<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customberinfo.aspx.cs" Inherits="JaisinghTest.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css" />
  
<script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
    <style type="text/css">

        .spancs{

            color:red;
        }

    </style>



</head>
<body>
        <script type="text/javascript">
            var objjj = {};
            var foredit = false;
            var namechk = false;
        function val() {

            alert('ddd')
            var data_row = table.row($(this).closest('tr')).data();
            alert(data_row)

            }

            function closemodel() {

                $('#myModal').modal('hide');


            }


            function delet(d) {
                var isdel = false;
                $.ajax({

                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',

                    url: "WebService1.asmx/deletecustom",
                    data: '{id:' + JSON.stringify(d) + '}',






                    success: function (data) {


                        console.log("response..");


                        console.log(data.d);

                        isdel = data.d;

                        if (isdel) {


                            alert("Deleted successfully");
                            getlistofcus();
                        }


                      
                        console.log("response.........................");
                      
                    



                    }




                    // Do something interesting here.

                });





            }

            function checkforname() {

                var v= document.getElementById("name").value;
                if (v == "" || v == null) {

                    namechk = true;

                    document.getElementById("namechk").innerText = "Name can not be empty";
                    return false;


                } else {

                    document.getElementById("namechk").innerText = "";
                    return true;

                }
                



            }

          

          
            function ValidateEmail(inputText) {
              
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (inputText.match(mailformat)) {
                   
                   
                    return true;
                }
                else {
                   
                  
                    return false;
                }
            }








         

        
            function checkforemail() {

              
                var v = document.getElementById("email").value;

                var s = ValidateEmail(v);

               



              
                if (s) {
                    document.getElementById("emailchk").innerText = "";
                    return true;
                   

                  


                } else {

                  
                    document.getElementById("emailchk").innerText = "invalid email";
                    return false;
                }




            }




            function phonenumber(inputtxt) {
                var phoneno = /^\d{10}$/;
                if (inputtxt.match(phoneno)) {
                    return true;
                }
                else {
                   
                    return false;
                }
            }

            function checkforphone() {

             
                var v = document.getElementById("phone").value;

                var s = phonenumber(v);

              




                if (s) {
                    document.getElementById("phonechk").innerText = "";
                    return true;





                } else {


                    document.getElementById("phonechk").innerText = "invalid Phone no";
                    return false;
                }




            }







            function setv(d) {

               

                $.ajax({

                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',

                    url: "WebService1.asmx/editcustomber",
                    data: '{id:' + JSON.stringify(d) + '}',






                    success: function (data) {


                        console.log("response..");


                        console.log(data.d);

                        
                        objjj = data.d;
                        console.log("response.........................");
                        console.log(objjj);
                        $('#myModal').modal('show');
                        document.getElementById("label1").innerText = "";
                        document.getElementById("label1").innerText = "edit customber";
                        foredit = true;

                     
                        document.getElementById("name").value = data.d.name;
                        document.getElementById("email").value = data.d.email;
                        document.getElementById("phone").value = data.d.phone;

                   

                    }




                    // Do something interesting here.

                });



            }
            function openmodel(){



                $('#myModal').modal('show');

                var theDiv = document.getElementById("label1").innerText = "create customber";
                document.getElementById("name").value = "";
                document.getElementById("email").value = "";
                document.getElementById("phone").value = "";


                foredit = false;
           


            }


            function getlistofcus() {

                if ($.fn.DataTable.isDataTable('#myTable')) {
                    $('#myTable').DataTable().destroy();
                }
                $('#myTable tbody').empty();



                $.ajax({

                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',

                    url: "WebService1.asmx/getcuslist",
                    data: "",






                    success: function (data) {


                        console.log("response..");


                        console.log(data.d);
                        var ss = [];
                        ss = data.d;

                      



                        $('#myTable').DataTable({
                            data: ss,
                            "columns": [
                                { data: "name" },
                                { data: "phone" },
                                { data: "email" },


                                { 'data': null, title: 'Action', wrap: true, "render": function (item) { return '<div class="btn-group"> <button type="button" onclick="setv(' + item.id + ')" value="0" class="btn btn-warning">edit</button></div>' } },

                                { 'data': null, title: 'Action', wrap: true, "render": function (item) { return '<div class="btn-group"> <button type="button" onclick="delet(' + item.id + ')" value="0" class="btn btn-warning">delete</button></div>' } },

                            ]
                        });


                    }




                    // Do something interesting here.

                });







            }



            $(document).ready(function () {
               

               
                getlistofcus();




               
            });






            function check() {


                if (foredit) {


                    edit();

                } else {


                    save();
                }

            }
            function save() {
              
                var obj = {};
                var issaved = false;

                var nchk = checkforname();
                if (!nchk) {
                    alert("enter the name")
                    return;

                }



                var chph = checkforphone();
                if (!chph) {

                    alert("enter the phone")
                    return;

                }

                var chem = checkforemail();
                if (!chem) {

                    alert("enter the email")
                    return;
                }





                obj.name = document.getElementById("name").value;
                obj.email = document.getElementById("email").value;
                obj.phone = document.getElementById("phone").value;








                $.ajax({

                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',

                    url: "WebService1.asmx/getcustomberdata",
                    data: '{obj:' + JSON.stringify(obj) + '}',






                    success: function (data) {


                        console.log("response..");
                   
               
                        console.log(data.d);
                        
                        issaved = data.d;

                        if (issaved) {


                            alert("saved successfully");
                            $('#myModal').modal('hide');
                            getlistofcus();

                        }
                           

                    }

                
                  

                  

                });
                debugger;
              
                 
                
               
                


            }

            function edit() {

               

                var obj = {};
                var issaved = false;


                var nchk = checkforname();
                if (!nchk) {
                    alert("enter the name")
                    return;

                }



                var chph = checkforphone();
                if (!chph) {

                    alert("enter the phone")
                    return;

                }

                var chem = checkforemail();
                if (!chem) {

                    alert("enter the email")
                    return;
                }








                obj.name = document.getElementById("name").value;
                obj.email = document.getElementById("email").value;
                obj.phone = document.getElementById("phone").value;
                obj.id = objjj.id;








                $.ajax({

                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',

                    url: "WebService1.asmx/updatecustom",
                    data: '{obj:' + JSON.stringify(obj) + '}',






                    success: function (data) {


                        console.log("response..");


                        console.log(data.d);

                        issaved = data.d;

                        if (issaved) {


                            alert("updated successfully");
                            $('#myModal').modal('hide');
                            getlistofcus();

                        }


                    }




                   

                });
                debugger;







            }

        </script>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="text-center" style="font-size:20px;font-weight:bolder;margin-bottom:20px;">CustomerList 
                <button style="float:right;font-size:16px;" onclick="openmodel()" type="button">Add new</button>
            </div>
            <table id="myTable">

                   <thead>
        <tr>
            <th>Name</th>
            <th>email</th>
            <th>phone</th>
        </tr>
    </thead>


            </table>
    
    
            <div class="modal" id="myModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <div class="text-center">
        <span id="label1"></span>
            <button type="button" onclick="check()"  style="float:right;">Save</button>

        </div>
     <%--   <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          <div class="row">
              <div class="col-sm-6">
                  <div class="col-sm-3">
                    Name:
                  </div>
                  <div class="col-sm-3">
                      <input  onblur="checkforname()"  type="text" id="name"  />
                      <span class="spancs" id="namechk"></span>
                  </div>
             


              </div>
              <div class="col-sm-6">

                     <div class="col-sm-3">
                      Phone:
                  </div>
                  <div class="col-sm-3">
                    <input onblur="checkforphone()"    type="email" id="phone" />
                      <span class="spancs" id="phonechk"></span>
                  </div>


               
              </div>
          </div>
              <div class="row" style="margin-top:5px;">
              <div class="col-sm-6">
                  <div class="col-sm-3">
                      email:
                  </div>
                  <div class="col-sm-3">
                      <input    onblur="checkforemail()"  type="text" id="email"  />
                      <span class="spancs"  id="emailchk"></span>
                  </div>
             


              </div>
              <div class="col-sm-6">

               


               
              </div>
          </div>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="closemodel()">Close</button>
      </div>

    </div>
  </div>
</div>
        </div>
    </form>
</body>
</html>
