import oracledb
from flask import Flask, jsonify, request
from flask_cors import CORS
import json

app = Flask(__name__)
CORS(app)

uname = "ADMIN"

pwd = "EmmanuelEsUnRico2000"

cdir = "./config_dir/"

walletLoc = "./config_dir/"

walletpwd = "SH$12.sdfY108hvHhdi`jwe"

dsn= "proyecto1basesi_medium"

@app.route('/api', methods=['GET'])
def getPeople():

    with oracledb.connect(user = uname, password = pwd, dsn = dsn, config_dir = cdir, wallet_location = walletLoc, wallet_password = walletpwd) as connection:
        with connection.cursor() as cursor:
            sql = "SELECT * FROM TABLE(SELECT_IMAGES_PANTALLA_PRINCIPAL)"
            cursor.execute(sql)
            rows = cursor.fetchall()
            result = []
            for row in rows:
                result.append(dict(zip([col[0] for col in cursor.description], row)))
            json_result = json.dumps(result, indent=4)

            print(json_result)
            return json_result

@app.route('/api/obs/<int:item_id>', methods=['GET'])
def getFullTax(item_id):

    with oracledb.connect(user = uname, password = pwd, dsn = dsn, config_dir = cdir, wallet_location = walletLoc, wallet_password = walletpwd) as connection:
        with connection.cursor() as cursor:
            sql = f"""
                SELECT * FROM TABLE(SELECT_IMAGE_OBSERVATIONS_TABLE({item_id}))
            """
            cursor.execute(sql)
            rows = cursor.fetchall()
            result = []
            for row in rows:
                result.append(dict(zip([col[0] for col in cursor.description], row)))
            json_result = json.dumps(result, indent=4)

            return json_result

@app.route('/api/identifications/<int:item_id>', methods=['GET'])
def getIdentifications(item_id):
     with oracledb.connect(user = uname, password = pwd, dsn = dsn, config_dir = cdir, wallet_location = walletLoc, wallet_password = walletpwd) as connection:
        with connection.cursor() as cursor:   
            sql = f"""
                SELECT * FROM(show_all_identifications({item_id}))
            """
            cursor.execute(sql)
            rows = cursor.fetchall()
            result = []
            for row in rows:
                result.append(dict(zip([col[0] for col in cursor.description], row)))
            json_result = json.dumps(result, indent=4)

            return json_result

@app.route('/api/upload', methods=['POST'])
def uploadData():
    try:
        # Parse JSON data from the request
        data = request.json
        
        # Extract values from the JSON data
        taken_date = data.get('takenDate')
        upload_date = data.get('uploadDate')
        person_id = data.get('personId')
        latitude = data.get('latitude')
        longitude = data.get('longitude')
        person_name = data.get('personName')
        taxon_name = data.get('taxonName')
        use_license = data.get('useLicense')
        url = data.get('url')
        note = data.get('note')
        
        # Connect to Oracle database
        with oracledb.connect(user=uname, password=pwd, dsn=dsn, config_dir=cdir, wallet_location=walletLoc, wallet_password=walletpwd) as connection:
            # Create cursor within the context of the connection
            with connection.cursor() as cursor:
                # Define the SQL statement with bind variables
                sql = """
                    BEGIN
                        create_new_image_and_observation(
                            :taken_date,
                            :upload_date,
                            :person_id,
                            :latitude,
                            :longitude,
                            :person_name,
                            :taxon_name,
                            :use_license,
                            :url,
                            :note
                        );
                    END;
                """
                
                # Execute the SQL statement with parameters
                cursor.execute(sql, (taken_date, upload_date, person_id, latitude, longitude, person_name, taxon_name, use_license, url, note))
            
            # Commit the transaction
            connection.commit()
        
        return jsonify({'message': 'Data uploaded successfully'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/mkInf', methods=['POST'])
def newId():
    try:
        # Parse JSON data from the request
        data = request.json
        
        # Extract values from the JSON data
        rank = data.get('rank')
        date = data.get('date')
        person_id = data.get("personId")
        obs = data.get("obs")
        
        # Connect to Oracle database
        with oracledb.connect(user=uname, password=pwd, dsn=dsn, config_dir=cdir, wallet_location=walletLoc, wallet_password=walletpwd) as connection:
            # Create cursor within the context of the connection
            with connection.cursor() as cursor:
                # Define the SQL statement with bind variables
                sql = """
                    BEGIN
                        new_identification(
                            :rank,
                            :obs,
                            :person_id,
                            :date
                        );
                    END;
                """
                
                # Execute the SQL statement with parameters
                cursor.execute(sql, (rank, obs, person_id, date))
            
            # Commit the transaction
            connection.commit()
        
        return jsonify({'message': 'Data uploaded successfully'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500


@app.route('/api/delObs', methods=['POST'])
def delObs():
    try:
        # Parse JSON data from the request
        data = request.json
        print(data)
        
        # Extract values from the JSON data
        imId = data.get('img')
        op = data.get('po')
        
        # Connect to Oracle database
        with oracledb.connect(user=uname, password=pwd, dsn=dsn, config_dir=cdir, wallet_location=walletLoc, wallet_password=walletpwd) as connection:
            # Create cursor within the context of the connection
            with connection.cursor() as cursor:
                # Define the SQL statement with bind variables
                sql = """
                    BEGIN
                        delete_image_observation(
                            :imId
                        );
                    END;
                """
                
                # Execute the SQL statement with parameters
                cursor.execute(sql, (imId))
            
            # Commit the transaction
            connection.commit()
        
        return jsonify({'message': 'Data uploaded successfully'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500


@app.route('/api/delInf', methods=['POST'])
def delInf():
    try:
        # Parse JSON data from the request
        data = request.json
        print(data)
        
        # Extract values from the JSON data
        infId = data.get('info')

        
        # Connect to Oracle database
        with oracledb.connect(user=uname, password=pwd, dsn=dsn, config_dir=cdir, wallet_location=walletLoc, wallet_password=walletpwd) as connection:
            # Create cursor within the context of the connection
            with connection.cursor() as cursor:
                # Define the SQL statement with bind variables
                sql = """
                    BEGIN
                        delete_identification(
                            :infId
                        );
                    END;
                """
                
                # Execute the SQL statement with parameters
                cursor.execute(sql, (infId, ))
            
            # Commit the transaction
            connection.commit()
        
        return jsonify({'message': 'Data uploaded successfully'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    print("server is running on port 8080")
    app.run(debug = True, port=8080)
