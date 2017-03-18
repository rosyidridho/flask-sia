from config import koneksi

def modelku():
    try:
        cursor = koneksi.cursor()

        query = """DELIMITER // \n
                    CREATE PROCEDURE delete_dsn_usr (IN id_dosen INT) BEGIN DECLARE id_user int; SELECT tb_user.usr_1 INTO id_user FROM tb_user WHERE usr_6=id_dosen AND usr_4=3; DELETE FROM tb_user WHERE usr_1=id_user; \n
                    END; //"""
        cursor.execute(query)
        koneksi.commit()

        cursor.close()


    except Exception as e:
        return {'error': str(e)}
    print query
    return query
