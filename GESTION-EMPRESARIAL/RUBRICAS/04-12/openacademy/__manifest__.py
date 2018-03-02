# -*- coding: utf-8 -*-
{
    'name': "openacademy",

    'summary': """
        Modulo para las rúbricas de la asignatura de Gorka II""",

    'description': """
		Con este modulo espero poder aprobar D:
    """,

    'author': "MocoNinja",
    'website': "http://www.yourcompany.com",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/master/odoo/addons/base/module/module_data.xml
    # for the full list
    'category': 'Test',
    'version': '0.1',

    # any module necessary for this one to work correctly
    'depends': ['base'],

    # always loaded
    'data': [
        # 'security/ir.model.access.csv',
        'templates.xml',
        'views/openacademy.xml',
        'views/partner.xml',
    ],
    # only loaded in demonstration mode
    'demo': [
        'demo/demo.xml',
    ],
}
