#include "dbtablenamesmodel.h"

dbTableNamesModel::dbTableNamesModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Connect to the database
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("C:\\Programming\\qt_projects\\aapdb.db");
    db.open();

    // Execute the query
    QSqlQuery query("SELECT name FROM sqlite_master WHERE type='table'");

    // Iterate over the result set and append the data to the list
    while (query.next())
    {
        QString table_name = query.value(0).toString();
        m_data
            << Data2(table_name, 1);
    }

    /*m_data
        << Data2("TN1", 4)
        << Data2("TN2", 7)
        << Data2("TN3", 8)
        << Data2("TN4", 3)
        << Data2("TN5", 4)
        << Data2("TN6", 2)
        << Data2("TN7", 3);*/
}

int dbTableNamesModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return m_data.count();
}

QVariant dbTableNamesModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const Data2 &data = m_data.at(index.row());
    if ( role == TableNameRole ){
        return data.table_name;
    }
    else if ( role == DataCountRole )
        return data.data_count;
    else
        return QVariant();
}

//--> slide
QHash<int, QByteArray> dbTableNamesModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {TableNameRole, "table_name"},
        {DataCountRole, "data_count"}
    };
    return mapping;
}
//<-- slide
