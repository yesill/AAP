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

double dbModel::getTotalCost()
{
    return total_cost;
}

double dbModel::getTotalProfit()
{
    return total_profit;
}

double dbModel::getTotalPrice()
{
    return total_cost + total_profit;
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

void dbModel::calculatePrice(QString table_name, int index, QString item_cost, QString number_of_items)
{
    if (number_of_items == ""){
        number_of_items = 0;
    }

    // ---> vector operations
    PriceCalcValues tempPCV;
    tempPCV.table_name = table_name;
    tempPCV.item_row = index;
    tempPCV.item_cost = item_cost.toDouble();
    tempPCV.number_of_items = number_of_items.toDouble();

    bool not_in_vector = true;

    if (price_calc_vector.isEmpty()){
        price_calc_vector.append(tempPCV);
    }
    else {
        for (int i=0; i<price_calc_vector.size(); i++){
            if (price_calc_vector.at(i).table_name == tempPCV.table_name
                    && price_calc_vector.at(i).item_row == tempPCV.item_row){

                price_calc_vector.replace(i, tempPCV);
                not_in_vector = false;

                /*price_calc_vector.remove(i);
                price_calc_vector.insert(i, tempPCV);*/
            }
        }
        if (not_in_vector){
            price_calc_vector.append(tempPCV);
        }
    }
    // <--- vector operations

    total_cost = 0;
    total_profit = 0;

    // ---> price calculating
    for (int i=0; i<price_calc_vector.size(); i++){
        double temp_cost = price_calc_vector.at(i).item_cost * (double)price_calc_vector.at(i).number_of_items;
        total_cost += temp_cost;
        total_profit += temp_cost * 0.6;
    }
    // <--- price calculating

    //del struct variables !!!!!!!!!!!!!
    emit numberOfItemsChangedSignal();
}

void dbModel::numberOfItemsChangedBasic(QString number_of_items, QString cost)
{
    if (number_of_items != ""){
        total_cost += cost.toInt() * number_of_items.toInt();
        total_profit = total_cost * 0.6;
        qDebug() << cost << total_cost << total_profit;
        emit numberOfItemsChangedSignal();
    }
}
//<-- slide
