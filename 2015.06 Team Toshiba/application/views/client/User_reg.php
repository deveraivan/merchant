<html>
 <body>
  <div id="container">
   <div id="login">
    <form>
     
     <legend>User Profile</legend>
      <fieldset>
       <p>First Name:<input type="text" id="firstname" required value="First Name"></p>
       <p>Last Name:<input type="text" id="lastname" required value="Last Name"></p>
       <p>Email:<input type="email" id="email" required value="Last Name"></p>
       <p>Address:<input type="text" id="address" required value="Last Name"></p>
       <p>Gender:</p>
       <p><input type="radio" name="sex" value="male">Male</p>
       <p><input type="radio" name="sex" value="female">Female</p>
       <p>Town/City:<input type="text" id="town_city" required value="Town/City"></p>       
       <p>Postal Code:<input type="text" id="postal_code" required value="Postal Code"></p>
       <p>Country:<select><option>----</option></select>
       <p>Company Address:<input type="text" id="comp_address" required value="Last Name"></p>
      </fieldset>
     
     <legend>User Account</legend>
      <fieldset>
       <p>Enter Username:<input type="text" id="username" placeholder="Username"></p>
       <p>Enter Password:<input type="password" id="password" placeholder="Password"></p>
       <p>Re-type Password:<input type="password" id="password" placeholder="Re-Enter Password"></p>
       <p><input type="submit" id="login" value="Login"></p>
      </fieldset>
                
    </form>
   </div>
  </div>
 </body>
</html>