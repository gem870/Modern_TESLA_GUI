#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>

class System : public QObject
{
    Q_OBJECT
public:
    explicit System(QObject *parent = nullptr);

signals:

};

#endif // SYSTEM_H
