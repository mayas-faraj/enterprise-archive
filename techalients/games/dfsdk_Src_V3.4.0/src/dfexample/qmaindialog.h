#ifndef QMAINDIALOG_H
#define QMAINDIALOG_H

#include <core/df/qdfsdkwrapper.h>
#include <QtWidgets>
#include <common/WaterEffect.h>

namespace Ui {
class QMainDialog;
}

enum E_Program
{
    E_PG_Test,
    E_PG_WaterWave,
};

//
// QPlayPane
//
class QPlayPane : public QWidget
{
    Q_OBJECT
public:
    explicit QPlayPane(QDfSdkWrapper& dfmgr, uchar displayIndex, QWidget *parent = 0);
    ~QPlayPane();

    void showTestProgram();
    void showWaterWaveProgram(QImage background);
protected:
    virtual void paintEvent(QPaintEvent *);

    virtual void mousePressEvent(QMouseEvent *);
    virtual void mouseReleaseEvent(QMouseEvent *);
    virtual void mouseMoveEvent(QMouseEvent *);

protected:
    void paintTest(QPainter& painter);


    void paintWaterWave(QPainter& painter);

private slots:
    void slotPointActive(uchar displayIndex, QList<T_DfPoint> points);
    void slotTimeRefreshUI();
private:
    E_Program       m_program;
    QDfSdkWrapper&     m_dfmgr;
    uchar           m_displayIndex;
    QTimer          m_refreshTimer;

    bool            m_lockFlag;
    QPoint          m_dragStartPosition;
    QPoint          m_point;
    bool            m_moveMode;
    bool            m_dragStarted;

    // water wave
    CWaterEffect    m_waterEffect;
    QImage          m_imgSrc;
    QImage          m_imgDst;
};

//
// QMainDialog
//
class QMainDialog : public QDialog
{
    Q_OBJECT

public:
    explicit QMainDialog(QWidget *parent = 0);
    ~QMainDialog();

private slots:
    void slotTraceLog(QByteArray log);
    void slotStateChanged(uchar senderIndex, bool connected);
private slots:
    void on_rbTest_clicked();

    void on_rbWaterWave_clicked();

    void on_rbNova_clicked();

    void on_rbYdea_clicked();

private:
    Ui::QMainDialog*ui;
    QDfSdkWrapper      m_dfmgr;
    QPlayPane*      m_playPane;
};

#endif // QMAINDIALOG_H
