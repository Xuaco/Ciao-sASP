<!DOCTYPE html>
<html>
  <body>

    <?php

      system('echo \'<htlm>false</html>\' > html/justification.html');
      
      system('echo \' ' . $_POST["query"] . '\' > query | ./../casp -w ' . $_POST["program"] . ' query');
      
      echo '<script>window.location.href = "html/justification.html";</script>';


      ?>

  </body>
</html>
      <!--     readfile("html/justification.html"); -->
