#ifndef MY_H
#define MY_H

#include <QObject>
#include <QQmlEngine>

class My : public QObject
{
    Q_OBJECT
public:
    static QObject *qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);

public:
    explicit My(QObject *parent = nullptr);
    Q_INVOKABLE QString readBuffer();
signals:

};

#endif // MY_H
