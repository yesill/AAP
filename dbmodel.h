#ifndef DBMODEL_H
#define DBMODEL_H

#include <QAbstractListModel>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QDebug>

struct Data {
    Data() {}
    Data( const QString& name, double cost, double profit )
        : name(name), cost(cost), profit(profit) {}
    QString name;
    double cost;
    double profit;
};

struct PriceCalcValues {
    PriceCalcValues() {}
    PriceCalcValues(QString table_name, int item_row, double item_cost, int number_of_items)
        : table_name(table_name), item_row(item_row), item_cost(item_cost), number_of_items(number_of_items) {}

    QString table_name;
    int item_row;
    double item_cost;
    double number_of_items;
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

    Q_INVOKABLE double getTotalCost();
    Q_INVOKABLE double getTotalProfit();
    Q_INVOKABLE double getTotalPrice();

signals:
    void numberOfItemsChangedSignal();

public slots:
    void getData(QString category_name);
    void calculatePrice(QString table_name, int index, QString item_cost, QString number_of_items);
    void numberOfItemsChangedBasic(QString number_of_items, QString cost);

private:
    int total_cost = 0, total_profit = 0;
    QVector< Data > m_data;
    QVector<PriceCalcValues> price_calc_vector;
};

#endif // DBMODEL_H
