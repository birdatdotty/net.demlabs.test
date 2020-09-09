#include "My.h"

#include <QBuffer>
#include <QClipboard>
#include <QDataStream>
#include <QApplication>

QObject *My::qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    static My *self = new My();
    return self;
}

My::My(QObject *parent) : QObject(parent)
{

}

QString My::readBuffer()
{
    QString ret;
    QClipboard* c = QApplication::clipboard();

    ret = c->text();

    return ret;
}
