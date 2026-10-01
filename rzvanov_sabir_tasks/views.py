from django.shortcuts import render
import os


def index(request):
  return render(request, 'index.html', {'secret_key': os.environ.get('FIREBASE_API_KEY', 'Ключ не найден')})

