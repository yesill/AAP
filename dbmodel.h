#ifndef DBMODEL_H
#define DBMODEL_H

#include <QAbstractListModel>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>

struct Data {
    Data() {}
    Data( const QString& name, double cost, double profit )
        : name(name), cost(cost), profit(profit) {}
    QString name;
    double cost;
    double profit;
};

class dbModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        NameRole = Qt::UserRole,
        CostRole,
        ProfitRole
    };

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

    explicit dbModel(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;

public slots:
    void getData(QString category_name);

private:
    QVector< Data > m_data;
};

#endif // DBMODEL_H
