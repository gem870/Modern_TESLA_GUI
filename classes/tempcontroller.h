#ifndef TEMPCONTROLLER_H
#define TEMPCONTROLLER_H

#include <QObject>

class TempController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int tempController READ tempController WRITE setTempController NOTIFY tempControllerChanged)
public:
    explicit TempController(QObject *parent = nullptr);

    int tempController() const;
    Q_INVOKABLE void tempIncreaseFunction(const int &tempNumber);

public slots:
    void setTempController(int newTempController);

signals:

    void tempControllerChanged();
private:
    int m_tempController;
};

#endif // TEMPCONTROLLER_H
