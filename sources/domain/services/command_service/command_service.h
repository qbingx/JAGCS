#ifndef COMMAND_SERVICE_H
#define COMMAND_SERVICE_H

// Qt
#include <QObject>

// Internal
#include "command.h"

namespace domain
{
    class CommandSender;

    class CommandService: public QObject
    {
        Q_OBJECT

    public:
        explicit CommandService(QObject* parent = nullptr);

        CommandSender* sender() const;

    public slots:
        void executeCommand(const Command& command);
        void rejectCommand(Command::CommandType type);

    signals:
        void commandStatusChanged(Command::CommandType type, Command::CommandStatus status);

    private:
        CommandSender* m_sender;
    };
}

#endif // COMMAND_SERVICE_H
