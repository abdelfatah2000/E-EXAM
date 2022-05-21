from pyexpat import model
from django.contrib import admin
from .models import Exam, ExamOptions
from . import models


admin.site.register(ExamOptions)
class ExamLine (admin.StackedInline):
    extra = 0
    model = models.ExamOptions
@admin.register (Exam)
class ExamAdmin(admin.ModelAdmin):
    inlines = [ExamLine]
    list_display = ['professor' ,'name' ,'level' ,'total' ,'time'  , 'chapter']
