#! /usr/bin/env python3
# -*- coding:utf-8 -*-

from math import sin, radians
from sys import argv

Ciclos = {"físico": 23, "emocional": 28, "intelectual": 33}
Dias = 0

'''
    Calculo los días desde la fecha de nacimiento SIN tener en cuenta 
    los años bisiestos y asumiendo meses de 30 días para simplificar el
    código
'''

def CalcularBiorritmos():
    global Dias
    global Ciclos
    for TipoCiclo in Ciclos:
        Valor = sin(radians(Dias) /  Ciclos[TipoCiclo])
        print(Valor)

def AsignarFecha(anyo, mes, dia):
    global Dias
    Dias = anyo * 365 + mes * 30 + dia

def CheckDateInput():
    porciones = argv[1].split("/")
    if len(porciones) == 3:
        print("Descomponiendo entrada...")
        try:
            anyo = int(porciones[0])
            mes = int(porciones[1])
            dia = int(porciones[2])
            if (mes < 1 or mes > 12 or dia < 1 or dia > 31 or anyo < 1990 or anyo > 2020):
                print("Rango de fechas incorrecto. Piénsatelas bien y ejecuta de nuevo...")
                return False
            AsignarFecha(anyo, mes, dia)
            return True
        except:
            pass
    print("Error parseando la fecha. Recuerda que debe estar pasada en un formato YYYY/MM/DD")
    return False

def LoadParameters():
    if len(argv) != 2:
        print("No se ha pasado una fecha de nacimiento")
        return False
    else:
        print("Se ha pasado como fecha de nacimiento: " + argv[1])
        return True

def Main():
    if not LoadParameters() or not CheckDateInput():
        return
    else:
        CalcularBiorritmos()

Main()
