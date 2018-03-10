# -*- coding: utf-8 -*-

from odoo import models, fields, api

# MODELO DE LA RUBRICA 2 -> COURSE


class Course(models.Model):
    _name = 'openacademy.course'
    name = fields.Char(string="Title", required=True)
    description = fields.Text()
    responsible_id = fields.Many2one('res.users', ondelete='set null', string="Responsible", index=True)
    session_ids = fields.One2many('openacademy.session', 'course_id', string="Sessions")


# Modelo de la rubrica 4 -> Session

class Session(models.Model):
    _name = 'openacademy.session' # Tabla en la base de datos
    name = fields.Char(required=True)
    start_date = fields.Date()
    duration = fields.Float(digits=(6, 2), help="Duration in days")
    seats = fields.Integer(string="Number of seats")
    instructor_id = fields.Many2one('res.partner', string="Instructor")
    course_id = fields.Many2one('openacademy.course', ondelete='cascade', string="Course", required=True)
    attendee_ids = fields.Many2many('res.partner', string="Attendees")


