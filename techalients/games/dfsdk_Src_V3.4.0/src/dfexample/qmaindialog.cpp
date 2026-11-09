#include "qmaindialog.h"
#include "ui_qmaindialog.h"
#include <sdk/df/dfsdk.h>
#include <QtWidgets>


//
// QPlayPane
//
QPlayPane::QPlayPane(QDfSdkWrapper& dfmgr, uchar displayIndex, QWidget* parent)
    : QWidget(parent, Qt::Dialog|Qt::FramelessWindowHint)
    , m_program(E_PG_Test)
    , m_dfmgr(dfmgr)
    , m_displayIndex(displayIndex)
    , m_lockFlag(false)
    , m_moveMode(false)
    , m_dragStarted(false)
{
    connect(&m_dfmgr, SIGNAL(pointActive(uchar,QList<T_DfPoint>)),
            this, SLOT(slotPointActive(uchar,QList<T_DfPoint>)));

    connect(&m_refreshTimer, SIGNAL(timeout()),
            this, SLOT(slotTimeRefreshUI()));
}

QPlayPane::~QPlayPane()
{

}

void QPlayPane::showTestProgram()
{
    m_program = E_PG_Test;
    m_refreshTimer.start(100);
    m_dfmgr.clearSensorState(m_displayIndex);
}

void QPlayPane::showWaterWaveProgram(QImage background)
{
    m_program = E_PG_WaterWave;

    m_imgSrc = QImage(width(), height(), QImage::Format_RGB32);

    m_imgSrc.fill(0);
    if(!background.isNull())
    {
        QBrush brush(background);
        QPainter p(&m_imgSrc);
        p.fillRect(m_imgSrc.rect(), brush);
    }

    m_imgDst = m_imgSrc;

    m_waterEffect.Create(width(), height());
    m_refreshTimer.start(30);
    m_dfmgr.clearSensorState(m_displayIndex);
}

void QPlayPane::paintEvent(QPaintEvent*)
{
    QPainter painter(this);
    switch (m_program)
    {
    case E_PG_WaterWave:
        paintWaterWave(painter);
        break;
    case E_PG_Test:
    default:
        paintTest(painter);
        break;
    }
}

void QPlayPane::mousePressEvent(QMouseEvent* event)
{

    if (event->button() != Qt::LeftButton)
    {
        QWidget::mousePressEvent(event);
        return;
    }

    if(E_PG_WaterWave == m_program)
    {
        QList<T_DfPoint> points;
        points.append({ event->pos().x(), event->pos().y(), 1, 0 });
        slotPointActive(m_displayIndex, points);
    }

    m_moveMode = false;
    if(!m_lockFlag)
    {
        m_point = event->globalPos();
        m_dragStartPosition = pos();
        m_dragStarted = false;
        m_moveMode = true;
    }

    QWidget::mousePressEvent(event);
}

void QPlayPane::mouseReleaseEvent(QMouseEvent* event)
{
    QWidget::mouseReleaseEvent(event);
    m_dragStarted = false;
    m_moveMode = false;
}

void QPlayPane::mouseMoveEvent(QMouseEvent* event)
{
    if (event->buttons() & Qt::LeftButton)
    {
        if(!m_dragStarted && m_moveMode)
        {
            if((event->globalPos()-m_point).manhattanLength()<7)
            {
                QWidget::mouseMoveEvent(event);
                return;
            }
            m_dragStarted = true;
        }
        if(m_dragStarted)
        {
            //qDebug() << __FUNCTION__;
            move(m_dragStartPosition + event->globalPos() - m_point);
        }
    }

    QWidget::mouseMoveEvent(event);
}

void QPlayPane::paintTest(QPainter& painter)
{
    DfHandle dfHandle;
    T_DfDisplayParam dispParam;
    if(!m_dfmgr.beginScene(m_displayIndex, &dfHandle, &dispParam))
    {
        Q_ASSERT(false);
        return;
    }

    const int sensorw = dispParam.sensorWidth;
    const int sensorh = dispParam.sensorHeight;
    const int dispw = dispParam.displayWidth;
    const int disph = dispParam.displayHeight;
    const int sensorRowCount = dispParam.sensorRowCount;
    const int sensorColCount = dispParam.sensorColCount;

    painter.setPen(QPen(Qt::black));
    for(int row=0, i=0; row<sensorRowCount; row++)
    {
        for(int col=0; col<sensorColCount; col++,i++)
        {
            QRect rectSensor(col*sensorw,row*sensorh,sensorw,sensorh);

            T_DfGroup group;
            T_DfSensorInfo sensorInfo;
            m_dfmgr.getSensorInfo(dfHandle, row, col, &sensorInfo, &group);

            QColor activeClr(Qt::yellow);
            if(group.sensorCount > 2)
                activeClr = QColor(Qt::red);
            else if(group.sensorCount > 1)
                activeClr = QColor(Qt::darkYellow);

            if(sensorInfo.activeTick > 0)
            {
                QColor cr = (sensorInfo.activeTick%2) ? activeClr : QColor(Qt::black);
                painter.fillRect(rectSensor, cr);
            }
            else if(sensorInfo.isActive)
            {
                painter.fillRect(rectSensor, activeClr);
            }
            else
            {
                QColor cr = sensorInfo.hadActive ? QColor(Qt::green) : QColor(Qt::black);
                painter.fillRect(rectSensor, cr);
            }
#ifdef QT_DEBUG
            painter.drawText(rectSensor, QString::number(sensorInfo.group));
#endif
        }
    }

    for(int r=0; r <= sensorRowCount; r++)
    {
        if(r%4==0) painter.setPen(QPen(Qt::yellow));
        else painter.setPen(r%2 ? QPen(Qt::gray, 1, Qt::DashLine) : QPen(Qt::lightGray));

        painter.drawLine(0, sensorh*r, dispw, sensorh*r);

        if(r%4==0 && r > 0)
            painter.drawLine(0, sensorh*r-1, dispw, sensorh*r-1);
    }
    for(int c = 0; c <= sensorColCount; c++)
    {
        if(c%4==0) painter.setPen(QPen(Qt::yellow));
        else painter.setPen(c%2 ? QPen(Qt::gray, 1, Qt::DashLine) : QPen(Qt::lightGray));

        painter.drawLine(sensorw*c, 0, sensorw*c, disph);
        if(c%4==0 && c > 0)
            painter.drawLine(sensorw*c-1, 0, sensorw*c-1, disph);
    }

    m_dfmgr.endScene(dfHandle);
}

void QPlayPane::paintWaterWave(QPainter& painter)
{
    painter.drawImage(0,0, m_imgDst);
}

void QPlayPane::slotPointActive(uchar displayIndex, QList<T_DfPoint> points)
{
    if(displayIndex != m_displayIndex)
        return;

    if(E_PG_WaterWave == m_program)
    {
        foreach (T_DfPoint pt, points)
            m_waterEffect.Blob(pt.x, pt.y, pt.sensorCount*2-1, 1000, m_waterEffect.m_iHpage);
    }
}

void QPlayPane::slotTimeRefreshUI()
{
    switch (m_program)
    {
    case E_PG_WaterWave:
        m_waterEffect.Render((uint*)m_imgSrc.bits(), (uint*)m_imgDst.bits());
        break;
    case E_PG_Test:
    default:
        m_dfmgr.decActiveTick(); // for active blink
        break;
    }
    update();
}


//
// QMainDialog
//
QMainDialog::QMainDialog(QWidget *parent) :
    QDialog(parent, Qt::Dialog | Qt::WindowMinMaxButtonsHint | Qt::WindowCloseButtonHint),
    ui(new Ui::QMainDialog),
    m_playPane(0)
{
    ui->setupUi(this);

    connect(&m_dfmgr, SIGNAL(traceLog(QByteArray)), this, SLOT(slotTraceLog(QByteArray)));
    connect(&m_dfmgr, SIGNAL(stateChanged(uchar,bool)), this, SLOT(slotStateChanged(uchar,bool)));

    // add display
    uchar displayIndex = m_dfmgr.addDisplay(E_DM_7_8, 2, 2);
    if(displayIndex != 0xFF)
    {
        // set connection
        //  2 3
        //  1 4
        T_DfPortConnection portConn[1];

        portConn[0].senderIndex = 0;
        portConn[0].mainPort = 0;
        portConn[0].receiverCount = 4;
        portConn[0].pos[0] = { 1, 0 };
        portConn[0].pos[1] = { 0, 0 };
        portConn[0].pos[2] = { 0, 1 };
        portConn[0].pos[3] = { 1, 1 };

        m_dfmgr.setDisplayConnection(displayIndex, portConn, _countof(portConn));

        // show play pane
        T_DfDisplayParam dispParam;
        if(!m_dfmgr.getDisplayParam(displayIndex, NULL, &dispParam))
        {
            Q_ASSERT(false);
            return;
        }

        m_playPane = new QPlayPane(m_dfmgr, 0, this);
        m_playPane->setGeometry(0,0, dispParam.displayWidth, dispParam.displayHeight);
        m_playPane->show();
        m_playPane->showTestProgram();
    }
    else
    {
        ui->teLog->appendPlainText(tr("Add display failed!"));
    }

}

QMainDialog::~QMainDialog()
{
    m_dfmgr.stopAllThread();
    m_playPane->close();
    delete ui;
}

void QMainDialog::slotTraceLog(QByteArray log)
{
    ui->teLog->appendPlainText(QString::fromUtf8(log));
}

void QMainDialog::slotStateChanged(uchar senderIndex, bool connected)
{
    Q_UNUSED(senderIndex);
    QColor cl(connected ? Qt::green : Qt::red);
    QPixmap pixmap(20,20);
    pixmap.fill(cl);
    ui->lbState->setPixmap(pixmap);
}

void QMainDialog::on_rbTest_clicked()
{
    m_playPane->showTestProgram();
}

void QMainDialog::on_rbWaterWave_clicked()
{
    m_playPane->showWaterWaveProgram(QImage(":/images/res/background.jpg"));
}

void QMainDialog::on_rbNova_clicked()
{
    m_dfmgr.stopAllThread();
    m_dfmgr.startReadNova("192.168.11.2", 0);
}

void QMainDialog::on_rbYdea_clicked()
{
    m_dfmgr.stopAllThread();
    QList<QByteArray> addres = m_dfmgr.getYdeaAddresses();
    if(addres.size() == 0)
    {
        ui->teLog->appendPlainText(tr("No Ydea sending card found!"));
        slotStateChanged(0, false);
        return;
    }
    m_dfmgr.startReadYdea(addres.at(0), 0);
}
