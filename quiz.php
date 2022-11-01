<?php
$x = new mysqli ('127.0.0.1', 'root', '', 'quiz');
$y = $x->query('SELECT t.Numer_testu, t.Pytania_id, t.Odpowiedzi_id, p.Zawartosc, o.Odpowiedz_na_pytanie FROM `testy` AS t JOIN pytania AS p ON p.id = Pytania_id JOIN odpowiedzi As o ON o.id = Odpowiedzi_id;
');
$a = $y->fetch_all(MYSQLI_ASSOC)
?>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="styl.css">
    <title>Memy</title>
</head>

<body>
    <form method="post">

    <?php

        $is_sex = 0;
            for($c = 0; $c <5;$c++){
                $i = rand(0,16);
                $row = 0;
                    if ($a[$i]['Odpowiedzi_id'] < 6){
                        $row = 3;
                    }
                    else if ($a[$i]['Odpowiedzi_id'] <11 and $a[$i]['Odpowiedzi_id'] >= 6){
                        $row = 5;
                    }
                    else{
                        $row = 4;
                    }
                    $dobra = rand(0,$row);
                    echo '
                    <br>     
                    To pytanie '.$a[$i]['Numer_testu'].'
                    <br>
                    Pytanie to '.$a[$i]['Zawartosc'].'<br>
                    ';
                    for ($i3 = 0; $i3 < $row; $i3++){
                    $i2 = rand(0,16);
                    if ($i3 == $dobra){
                        echo '
                            Możliwą odpowiedzią jest '.$a[$i]['Odpowiedz_na_pytanie'].' <input type="checkbox" name="x" type="text" value ="y"><br>
                        ';
                    }
                    else{
                        echo '
                            Możliwą odpowiedzią jest '.$a[$i2]['Odpowiedz_na_pytanie'].' <input type="checkbox" name="x" type="text" value = "n"><br>
                        ';
                    }

                    $sex = $a[$i]['Numer_testu'];
                    for($x = 0; $x < 16;$x++){
                        if($sex == $a[$x]['Numer_testu']){
                            echo 'sex'.$a[$x]['Odpowiedz_na_pytanie'];
                        }
                    }
                    
                }
                if (isset($_POST['x']) and $_POST['x'] == 'y'){
                    $is_sex++;
                }
                echo '
                </div>

                    ';
                }
            
        ?>
                    <br>
                    <button type="submit">sex</button><br>
                        </form>
</body>

</html>