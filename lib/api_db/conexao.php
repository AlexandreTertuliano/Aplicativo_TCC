<?php
$banco = 'marqueMed';
$host = 'marquemed.c5b8pct8bfdk.us-east-2.rds.amazonaws.com';
$usuario = 'admin';
$senha = 'marquemed2021TCC!';

date_default_timezone_set('America/Sao_Paulo');

try {
    $pdo = new PDO("mysql:dbname=$banco;host=$host/charset=utf8", "$usuario", "$senha");
} catch (Exception $e) {
    echo "Erro ao conectar com o banco de dados! ".$e;
}
