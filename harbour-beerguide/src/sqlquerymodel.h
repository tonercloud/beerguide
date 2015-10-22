#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H

#include <QSqlQueryModel>
 
class SqlQueryModel : public QSqlQueryModel
{
    Q_OBJECT
 
public:
    explicit SqlQueryModel(QString baseQuery, QObject *parent = 0)
        : QSqlQueryModel(parent),
          m_baseQuery(baseQuery)
    {
    }

    Q_INVOKABLE void filter(QString column, int value)
    {
        setQuery(m_baseQuery + " WHERE " + column + " = " + QString::number(value));
        ;
    }

    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const {	return m_roleNames;	}
 
private:
    void generateRoleNames();

    QHash<int, QByteArray> m_roleNames;
    QString m_baseQuery;
};

#endif // SQLQUERYMODEL_H
