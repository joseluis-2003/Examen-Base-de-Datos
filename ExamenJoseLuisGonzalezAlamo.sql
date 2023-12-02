-- Ejercicio 1
Delimiter $$
DROP PROCEDURE IF EXISTS calcularPotencias;
CREATE PROCEDURE calcularPotencias(
    IN numero INT,
    OUT cuadrado INT,
    OUT cubo INT
)
BEGIN
    SET cuadrado = numero * numero;
    SET cubo = numero * numero * numero;
END $$
DELIMITER ;

SET @numero = 5;
CALL calcularPotencias(@numero, @cuadrado, @cubo);
SELECT @numero AS Numero, @cuadrado AS Cuadrado, @cubo AS Cubo;

-- Ejercicio 2
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerDescripcionCategoria;
CREATE PROCEDURE obtenerDescripcionCategoria(
    IN categoriaID INT,
    OUT categoriaDescripcion VARCHAR(255)
)
BEGIN
    SELECT Description INTO categoriaDescripcion
    FROM categories
    WHERE CategoryID = categoriaID;
END $$
DELIMITER ;

SET @idCategoria = 1;
CALL obtenerDescripcionCategoria(@idCategoria, @descripcionCategoria);
SELECT @descripcionCategoria AS DescripcionCategoria;

-- Ejercicio 3
Delimiter $$
DROP PROCEDURE IF EXISTS generarCadena;
CREATE PROCEDURE generarCadena(
    IN letra CHAR(1),
    IN numero INT,
    OUT cadenaGenerada VARCHAR(255)
)
BEGIN
    IF numero <= 0 THEN
        SET cadenaGenerada = letra;
    ELSE
        SET cadenaGenerada = REPEAT(letra, numero);
    END IF;
END $$
DELIMITER ;

SET @letra = 'A';
SET @numero = 3;
CALL generarCadena(@letra, @numero, @cadenaGenerada);
SELECT @cadenaGenerada AS CadenaGenerada;

-- Ejercicio 4
DELIMITER $$
DROP PROCEDURE IF EXISTS calcularSumaPreciosUnitarios;
CREATE PROCEDURE calcularSumaPreciosUnitarios(
    OUT sumaPrecios DECIMAL(10,2)
)
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE precioUnitario DECIMAL(10,2);
    SET sumaPrecios = 0;
    
    WHILE contador <= 77 DO
        SELECT UnitPrice INTO precioUnitario FROM products WHERE ProductID = contador;
        SET sumaPrecios = sumaPrecios + precioUnitario;
        SET contador = contador + 1;
    END WHILE;
    
END $$
DELIMITER ;

CALL calcularSumaPreciosUnitarios(@sumaPrecios);
SELECT @sumaPrecios AS SumaPrecios;

