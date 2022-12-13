#ifndef DBTABLENAMESMODEL_H
#define DBTABLENAMESMODEL_H

#include <QAbstractListModel>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>


struct Data2 {
    Data2() {}
    Data2( const QString& table_name, int data_count)
        : table_name(table_name), data_count(data_count){}
    QString table_name;
    int data_count;
};

class dbTableNamesModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        TableNameRole = Qt::UserRole,
        DataCountRole
    };

    explicit dbTableNamesModel(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;

private:
    QVector< Data2 > m_data;
};

#endif // DBTABLENAMESMODEL_H
