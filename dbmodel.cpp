#include "dbmodel.h"

dbModel::dbModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Connect to the database
    db.setDatabaseName("C:\\Programming\\qt_projects\\aapdb.db");
    /*db.open();

    // Execute the query
    QSqlQuery query("SELECT Name, Cost, Profit FROM KITCHEN");

    // Iterate over the result set and append the data to the list
    while (query.next())
    {
        QSqlRecord record = query.record();
        m_data
            << Data(
                    record.value("Name").toString(),
                    record.value("Cost").toDouble(),
                    record.value("Profit").toDouble()
                );
    }

    db.close();*/

    /*m_data
        << Data("Deneme1", 2000, 1200)
        << Data("ANFAIONWŞAASIGIASGMAHSN", 60, 36);*/
}

int dbModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return m_data.count();
}

QVariant dbModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const Data &data = m_data.at(index.row());
    if ( role == NameRole ){
        return data.name;
    }
    else if ( role == CostRole )
        return data.cost;
    else if ( role == ProfitRole )
        return data.profit;
    else
        return QVariant();
}

//--> slide
QHash<int, QByteArray> dbModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {NameRole, "name"},
        {CostRole, "cost"},
        {ProfitRole, "profit"}
    };
    return mapping;
}

void dbModel::getData(QString category_name)
{
    db.open();

    //clear m_data before adding new table rows.
    m_data.clear();

    QString query_string = "SELECT Name, Cost, Profit FROM " + category_name;

    QSqlQuery query(query_string);

    while (query.next())
    {
        QSqlRecord record = query.record();
        m_data
            << Data(
                    record.value("Name").toString(),
                    record.value("Cost").toDouble(),
                    record.value("Profit").toDouble()
                );
    }
}
//<-- slide
